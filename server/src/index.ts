import type { Request, Response } from 'express';
import "dotenv/config";
import cors from "cors";
import express from 'express';
import http from 'http';
import productRoutes from './routes/productRoutes.js';
import cookieParser from 'cookie-parser';
import authRoutes from './routes/authRoutes.js';
import projectRoutes from './routes/projectRoutes.js';
import splatRoutes from './routes/splatRoutes.js';
import path from 'path';
import { fileURLToPath } from 'url';

const app = express();
const port = process.env.PORT || 3000;

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// 프록시 뒤(HTTPS)에서 쿠키를 쓰면 필요 (Railway, Vercel 등)
app.set('trust proxy', 1);

// CORS 설정: Vercel 도메인과 로컬 개발 환경 모두 허용
const allowedOrigins = [
  process.env.CLIENT_URL || 'http://localhost:3001',
  /\.vercel\.app$/, // 모든 Vercel 도메인 허용
];

app.use(cors({
  credentials: true,
  origin: (origin, callback) => {
    // origin이 없으면 (같은 도메인에서 요청) 허용
    if (!origin) {
      return callback(null, true);
    }
    
    // 허용된 origin인지 확인
    const isAllowed = allowedOrigins.some(allowedOrigin => {
      if (typeof allowedOrigin === 'string') {
        return origin === allowedOrigin;
      }
      if (allowedOrigin instanceof RegExp) {
        return allowedOrigin.test(origin);
      }
      return false;
    });
    
    if (isAllowed) {
      callback(null, true);
    } else {
      callback(new Error('Not allowed by CORS'));
    }
  }
}));

app.use(express.json());
app.use(cookieParser());

// 정적 파일 서빙 (uploads, splats 디렉토리)
app.use('/uploads', express.static(path.join(__dirname, '../uploads')));
app.use('/splats', express.static(path.join(__dirname, '../splats')));

app.use("/api/auth", authRoutes);
app.use("/api/products", productRoutes);
app.use("/api/projects", projectRoutes);
app.use("/api/splat", splatRoutes);

app.listen(port, () => {
  console.log(`server is running on port ${port}`);
});