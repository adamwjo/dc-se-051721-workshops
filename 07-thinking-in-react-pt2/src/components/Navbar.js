

export const Navbar = () => {
    return (
        <nav className="navbar navbar-expand-sm bg-success navbar-dark">
            <div className="container">
                <h4 className="navbar-brand">CoolApp</h4>
            </div>
            <div className="collapse navbar-collapse" id="#navbarCollapse">
                <ul className="navbar-nav ml-auto">
                    <li className="nav-item">
                        <p className="nav-link">Home</p>
                    </li>
                    <li className="nav-item">
                        <p className="nav-link">Other</p>
                    </li>
                    <li className="nav-item">
                        <p className="nav-link">Account</p>
                    </li>
                </ul>
            </div>
        </nav>
    )
}

export default Navbar

