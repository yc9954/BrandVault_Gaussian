import './CreatorHeader.css'

function CreatorHeader() {
    return (
    <header className='side-bar'>
        <nav>
            <ol className='header-nav-list'>
                <li> Product Library </li>
                <li> My Projects </li>
                <li> Dashboard </li>
                <li> Earnings </li>
                <li> Settings </li>
            </ol>
        </nav>
    </header>
    );
}

export default CreatorHeader