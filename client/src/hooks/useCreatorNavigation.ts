import { useNavigate } from 'react-router-dom';

export const useCreatorNavigation = () => {
    const navigate = useNavigate();
    const goToCreator = () => {
        navigate('/creator/');
    };
    const goToDashboard = () => {
        navigate('/creator/dashboard');
    };
    return { goToCreator, goToDashboard };
};