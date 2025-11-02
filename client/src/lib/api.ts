import axios from 'axios';

/**
 * API Base URL 설정
 * 환경변수 REACT_APP_API_URL이 있으면 사용하고, 없으면 로컬 개발용 localhost 사용
 */
const API_BASE_URL = process.env.REACT_APP_API_URL || 'http://localhost:3000';

/**
 * axios 인스턴스 생성
 * 모든 API 요청에 공통 설정 적용
 */
export const api = axios.create({
  baseURL: API_BASE_URL,
  withCredentials: true, // 쿠키 인증을 위해 필수
  headers: {
    'Content-Type': 'application/json',
  },
});

/**
 * API Base URL을 직접 사용해야 하는 경우 (예: fetch 사용)
 */
export const getApiBaseUrl = (): string => API_BASE_URL;

export default api;

