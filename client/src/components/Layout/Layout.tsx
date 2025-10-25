import './Layout.css'
import React from 'react'

interface LayoutProps {
    header: React.ReactNode;
    children: React.ReactNode;
}
function Layout({header, children}:LayoutProps) {
    return (
        <div className='layout'>
            {header}
            <main>{children}</main>
        </div>
    )
}

export default Layout