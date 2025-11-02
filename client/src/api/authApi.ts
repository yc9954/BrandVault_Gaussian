import { api } from '../lib/api';

/**
 * Creator 로그인 (자동 로그인)
 */
export const loginCreator = async (): Promise<{ message: string }> => {
  const response = await api.post('/api/auth/login/creator', {});
  return response.data;
};

/**
 * Brand 로그인
 */
export const loginBrand = async (): Promise<{ message: string }> => {
  const response = await api.post('/api/auth/login/brand', {});
  return response.data;
};

