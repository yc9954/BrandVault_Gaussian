import React from 'react';
import './App.css';
import { BrowserRouter, Routes, Route, Link } from 'react-router-dom';
import HomePage from './pages/HomePage';
import LoginPage from './pages/LoginPage';

function App() {
  return (
    <BrowserRouter>
    
    <div className="App">
      <Routes>
        <Route path='/' element={<HomePage />} />
        <Route path='/signin' element = {<LoginPage />} />
      </Routes>
    </div>
    </BrowserRouter>
  );
}

export default App;
