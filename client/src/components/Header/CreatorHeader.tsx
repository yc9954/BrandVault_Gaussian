import './CreatorHeader.css'
import type { ContentName } from '../../types';

interface CreatorHeaderProps {
    onSelect: (contentName: ContentName) => void
}

function CreatorHeader({onSelect}: CreatorHeaderProps) {
    return (
    <header className='side-bar'>
        <nav>
            <ol className='header-nav-list'>
                <li>
            <button onClick={() => onSelect('product')}>
              Product Library
            </button>
          </li>
          <li>
            <button onClick={() => onSelect('projects')}>
              My Projects
            </button>
          </li>
          <li>
            <button onClick={() => onSelect('dashboard')}>
              Dashboard
            </button>
          </li>
          <li>
            <button onClick={() => onSelect('earnings')}>
              Earnings
            </button>
          </li>
          <li>
            <button onClick={() => onSelect('settings')}>
              Settings
            </button>
          </li>
            </ol>
        </nav>
    </header>
    );
}

export default CreatorHeader