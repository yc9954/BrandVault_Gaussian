import React from 'react';
import './ImageButton.css';

interface ButtonProps {
  onClick: () => void;
  imageSrc: string;
  altText: string;
}

const ImageButton: React.FC<ButtonProps> = ({ onClick, imageSrc, altText}) => {
  return (
    <button className='icon-button' onClick={onClick}>
      <img className='icon-image' src={imageSrc} alt={altText} />
    </button>
  );
};

export default ImageButton;