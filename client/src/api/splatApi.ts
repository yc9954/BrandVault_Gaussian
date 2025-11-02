import { api, getApiBaseUrl } from '../lib/api';

// 인증 토큰 가져오기 (쿠키에서)
const getAuthHeaders = () => {
  return {
    headers: {
      'Content-Type': 'multipart/form-data',
    },
  };
};

export interface UploadResponse {
  message: string;
  jobId: string;
  status: 'processing' | 'completed' | 'failed';
}

export interface JobStatus {
  jobId: string;
  status: 'processing' | 'completed' | 'failed';
}

/**
 * 이미지 업로드 및 .splat 변환 시작
 */
export const uploadImagesAndConvert = async (files: File[]): Promise<UploadResponse> => {
  const formData = new FormData();
  files.forEach((file) => {
    formData.append('images', file);
  });

  const response = await api.post<UploadResponse>(
    '/api/splat/convert',
    formData,
    getAuthHeaders()
  );

  return response.data;
};

/**
 * 작업 상태 확인
 */
export const getJobStatus = async (jobId: string): Promise<JobStatus> => {
  const response = await api.get<JobStatus>(`/api/splat/status/${jobId}`);

  return response.data;
};

/**
 * .splat 파일 다운로드 URL 생성
 */
export const getSplatDownloadUrl = (jobId: string): string => {
  return `${getApiBaseUrl()}/api/splat/stream/${jobId}`;
};

