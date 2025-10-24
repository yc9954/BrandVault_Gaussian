import logo from '../logo.svg'
import ImageButton from '../components/ImageButton'
import googlelogo from '../assets/images/google_logo.svg'
function HomePage() {
  return (
    <div className="App">
      <header className="App-header">
        <div>
          <img src={logo} className="App-logo" alt="logo" />
          <p>Binu AI</p>
        </div>
        <p>
          Quasar: Monetize <br/ >
          Your Space
        </p>
        <p>
          The AdSense for Short-form Video
        </p>
        <div>
          <button>Creator Login</button>
          <button>Advertiser Login</button>
        </div>
        <hr />
        <p>Or continue with</p>
        <div>
          <ImageButton onClick={() => {}} imageSrc={googlelogo} altText=''></ImageButton>
          <ImageButton onClick={() => {}} imageSrc={googlelogo} altText=''></ImageButton>
          <ImageButton onClick={() => {}} imageSrc={googlelogo} altText=''></ImageButton>
        </div>
      </header>
    </div>
  );
}

export default HomePage;