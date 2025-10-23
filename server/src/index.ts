import type { Request, Response } from 'express';
import express from 'express'
import http from 'http';
import { Server as SocketIOServer } from 'socket.io';

// 1. Express 앱 초기화
const app = express();
const port = process.env.PORT || 3000; // 환경 변수 PORT 사용, 없으면 3000

// 2. HTTP 서버 생성 (Socket.io는 HTTP 서버 위에 동작함)
const server = http.createServer(app);

// 3. Socket.io 서버 초기화
// CORS 설정을 추가하여 프론트엔드와 통신 가능하게 함
const io = new SocketIOServer(server, {
  cors: {
    origin: '*', // 실제 운영 시에는 특정 프론트엔드 도메인으로 변경해야 보안에 좋음
    methods: ['GET', 'POST'],
  },
});

// 4. 미들웨어 및 라우트 설정
app.use(express.json()); // JSON 요청 본문 파싱

// 기본 라우트 (서버 상태 확인용)
app.get('/', (req: Request, res: Response) => {
  res.send('Server is running and operational!');
});

// 5. Socket.io 연결 처리
io.on('connection', (socket) => {
  console.log('새로운 소켓 클라이언트가 연결되었습니다:', socket.id);

  // 클라이언트가 'chat message' 이벤트를 보냈을 때 처리
  socket.on('chat message', (msg) => {
    console.log('메시지 수신:', msg);
    // 연결된 모든 클라이언트에게 메시지를 다시 브로드캐스트
    io.emit('chat message', msg); 
  });

  // 클라이언트 연결 해제 시
  socket.on('disconnect', () => {
    console.log('소켓 클라이언트 연결 해제됨:', socket.id);
  });
});

// 6. 서버 리스닝 시작
server.listen(port, () => {
  console.log(`⚡️ Server is listening on port ${port}`);
});