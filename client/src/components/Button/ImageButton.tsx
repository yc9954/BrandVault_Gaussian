import React from 'react';
import './ImageButton.css';

// 1. Props 인터페이스는 그대로 유지합니다.
interface ImageButtonProps {
  onClick: () => void;
  imageSrc: string;
  altText: string;
  type?: 'button' | 'submit' | 'reset'; 
}

function ImageButton({ onClick, imageSrc, altText, type = 'button' }: ImageButtonProps) {
  return (
    // 4. type 속성을 추가하여 기본 동작(Submit) 방지
    <button className='icon-button' onClick={onClick} type={type}>
      <img className='icon-image' src={imageSrc} alt={altText} />
    </button>
  );
}

export default ImageButton;