# 배포 가이드 (Deployment Guide)

이 문서는 BrandVault 프로젝트를 로컬 개발 환경부터 프로덕션 배포까지 전 과정을 안내합니다.

---

## 0️⃣ 최신 코드 받기

```bash
git clone https://github.com/yc9954/BrandVault_Gaussian.git
cd BrandVault_Gaussian
git pull
```

---

## 1️⃣ 서버 설정 및 로컬 테스트

### (1) 환경변수 설정

`server/.env.example` 파일을 복사하여 `server/.env` 파일을 생성하고 값을 채워넣으세요:

```bash
cd server
cp .env.example .env
```

`server/.env` 파일 내용 예시 (로컬 개발용):

```env
NODE_ENV=development
PORT=3000

# 프론트엔드 URL (CORS용)
CLIENT_URL=http://localhost:3001

# 데이터베이스
DATABASE_URL="postgresql://user:password@localhost:5432/database?schema=public"

# JWT Secret (강력한 랜덤 문자열로 변경)
JWT_SECRET=change_me_to_a_strong_random_secret

# Replicate API Token (splat 변환용, 사용하는 경우만)
REPLICATE_API_TOKEN=your_replicate_api_token_here
```

### (2) 서버 시작

```bash
cd server
npm install
npx prisma generate  # Prisma 사용 시
npm run dev           # 또는 npm start
```

### (3) 헬스 체크

```bash
curl -i http://localhost:3000/api/health
```

→ 200 OK 응답이 오면 정상입니다.

---

## 2️⃣ 프론트엔드 설정 및 로컬 테스트

### (1) 환경변수 설정

`client/.env.development` 파일이 이미 생성되어 있습니다. 필요시 수정하세요:

```env
REACT_APP_API_URL=http://localhost:3000
```

### (2) 개발 서버 시작

```bash
cd client
npm install
npm start
```

### (3) 브라우저에서 확인

1. 브라우저에서 `http://localhost:3001` 접속
2. **DevTools → Network 탭** 열기
3. API 요청이 `http://localhost:3000/...`로 나가는지 확인
4. 응답이 200 OK면 정상입니다.

---

## 3️⃣ 프로덕션 배포 준비

### 프론트엔드 (Vercel)

**⚠️ 중요**: `.env.production` 파일은 **절대 커밋하지 마세요**. Vercel 대시보드에서만 설정합니다.

Vercel에서 설정할 환경변수:
```
REACT_APP_API_URL=https://brandvaultgaussian-production.up.railway.app
```

### 백엔드 (Railway)

Railway에서 설정할 환경변수:
```
NODE_ENV=production
PORT=3000
CLIENT_URL=https://brand-vault-gaussian.vercel.app
DATABASE_URL=... (Railway에서 자동 생성되거나 직접 설정)
JWT_SECRET=... (강력한 랜덤 문자열)
REPLICATE_API_TOKEN=... (필요한 경우)
```

---

## 4️⃣ 코드 변경 및 배포

### (1) 코드 변경 후 커밋 & 푸시

```bash
git add -A
git commit -m "Your commit message"
git push gaussian main
```

### (2) 자동 배포 트리거

- **프론트엔드 코드 변경** 푸시 → **Vercel**이 자동으로 빌드/배포
- **백엔드 코드 변경** 푸시 → **Railway**가 자동으로 빌드/배포

### (3) 환경변수 변경 시

환경변수를 추가하거나 변경한 경우, 자동 배포만으로는 반영되지 않습니다:

#### Vercel (프론트엔드)
1. Vercel 대시보드 → 프로젝트 → **Settings** → **Environment Variables**
2. 환경변수 추가/수정
3. **Save** 후 **Redeploy** 클릭

#### Railway (백엔드)
1. Railway 대시보드 → 프로젝트 → **Variables** 탭
2. 환경변수 추가/수정
3. **Apply changes** → **New Deployment**

---

## 5️⃣ 프로덕션 환경변수 설정

### Vercel (프론트엔드)

1. **Vercel 대시보드** → 프로젝트 선택 → **Settings** → **Environment Variables**
2. 다음 환경변수 추가:
   ```
   Key: REACT_APP_API_URL
   Value: https://brandvaultgaussian-production.up.railway.app
   Environment: Production (또는 All)
   ```
3. **Save** 클릭
4. 상단 메뉴에서 **Deployments** → 최신 배포 → **⋯** → **Redeploy**

### Railway (백엔드)

1. **Railway 대시보드** → 프로젝트 선택 → **Variables** 탭
2. 다음 환경변수 추가/수정:
   ```
   CLIENT_URL = https://brand-vault-gaussian.vercel.app
   NODE_ENV = production
   DATABASE_URL = (Railway에서 자동 생성되거나 설정)
   JWT_SECRET = (강력한 랜덤 문자열 생성)
   REPLICATE_API_TOKEN = (필요한 경우)
   ```
3. **Apply changes** 클릭
4. **New Deployment** 실행

---

## 6️⃣ 최종 검증

### (1) 프론트엔드 확인

1. 브라우저에서 `https://brand-vault-gaussian.vercel.app` 접속
2. **DevTools → Network 탭** 열기
3. API 요청의 **Request URL** 확인:
   - ✅ `https://brandvaultgaussian-production.up.railway.app/...` (정상)
   - ❌ `http://localhost:3000/...` (환경변수 미설정)

### (2) 백엔드 헬스 체크

```bash
curl -i https://brandvaultgaussian-production.up.railway.app/api/health
```

→ 200 OK 응답 확인

### (3) CORS 확인

프론트엔드에서 API 요청 시 브라우저 콘솔에 CORS 오류가 없어야 합니다.

---

## 7️⃣ 문제 해결 (Troubleshooting)

### 문제 1: API 요청이 여전히 localhost로 나감

**원인**: Vercel 환경변수가 설정되지 않았거나 재배포가 안 됨

**해결**:
1. Vercel 대시보드에서 `REACT_APP_API_URL` 환경변수 확인
2. 환경변수 저장 후 **Redeploy** 필수
3. 코드에서 `process.env.REACT_APP_API_URL` 직접 사용하는지 확인

### 문제 2: CORS 에러

**원인**: 서버에서 프론트엔드 도메인을 허용하지 않음

**해결**:
1. Railway에서 `CLIENT_URL` 환경변수가 정확한 Vercel 도메인인지 확인
2. `server/src/index.ts`의 CORS 설정 확인
3. `trust proxy` 설정 확인 (`app.set('trust proxy', 1)`)

### 문제 3: 쿠키가 저장되지 않음 (프로덕션)

**원인**: 쿠키 옵션(`SameSite`, `Secure`) 설정 문제

**해결**:
1. 프로덕션에서는 `sameSite: 'none'`, `secure: true` 필수
2. `server/src/controllers/authController.ts` 확인
3. 프록시 설정 확인 (`app.set('trust proxy', 1)`)

### 문제 4: Mixed Content 에러

**원인**: HTTPS 프론트엔드에서 HTTP API 호출

**해결**: API URL도 HTTPS여야 합니다 (Railway는 기본적으로 HTTPS 제공)

---

## 8️⃣ 주요 파일 위치

### 프론트엔드
- API 설정: `client/src/lib/api.ts`
- API 호출: `client/src/api/*.ts`
- 환경변수: Vercel 대시보드에서 설정

### 백엔드
- 서버 설정: `server/src/index.ts`
- CORS 설정: `server/src/index.ts` (20-51줄)
- 쿠키 설정: `server/src/controllers/authController.ts`
- 환경변수: Railway 대시보드에서 설정

---

## 📝 체크리스트

배포 전 확인 사항:

- [ ] 서버 로컬에서 정상 작동 확인
- [ ] 프론트엔드 로컬에서 정상 작동 확인
- [ ] Vercel 환경변수 설정 (`REACT_APP_API_URL`)
- [ ] Railway 환경변수 설정 (`CLIENT_URL`, `NODE_ENV` 등)
- [ ] Vercel 재배포 완료
- [ ] Railway 재배포 완료
- [ ] 프로덕션 프론트엔드에서 API 요청이 Railway로 나가는지 확인
- [ ] 프로덕션에서 CORS 오류 없는지 확인
- [ ] 프로덕션에서 로그인/쿠키 정상 작동 확인

---

## 🔗 참고 링크

- [Vercel 문서](https://vercel.com/docs)
- [Railway 문서](https://docs.railway.app)
- [Prisma 문서](https://www.prisma.io/docs)

