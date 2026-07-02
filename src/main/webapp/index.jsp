<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StockPro | Advanced Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body { background-color: #0f172a; color: white; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .navbar-custom { background: #1e293b; border-bottom: 1px solid #334155; }
        .nav-link { color: #94a3b8 !important; font-weight: 500; }
        .nav-link:hover { color: #38bdf8 !important; }
        
        /* Professional Ticker */
        .ticker-wrap { background: #1e293b; padding: 12px 0; border-bottom: 1px solid #334155; overflow: hidden; }
        .ticker-item { display: inline-block; padding: 0 25px; border-right: 1px solid #334155; font-size: 0.9rem; }
        .up { color: #22c55e; } .down { color: #ef4444; }

        /* Stock Table Styling */
        .table-container { background: #1e293b; border-radius: 15px; padding: 25px; margin-top: 30px; border: 1px solid #334155; }
        .table { color: white; border-color: #334155; vertical-align: middle; }
        .table thead { background: #0f172a; }
        .stock-logo { width: 35px; height: 35px; border-radius: 8px; margin-right: 10px; display: flex; align-items: center; justify-content: center; background: #334155; }
        
        .btn-action { border-radius: 8px; font-weight: 600; padding: 6px 15px; transition: 0.2s; }
        .btn-buy { background: #22c55e; border: none; color: white; }
        .btn-buy:hover { background: #16a34a; }
        .btn-sell { background: #ef4444; border: none; color: white; }
        .btn-sell:hover { background: #dc2626; }
        .btn-graph { background: transparent; border: 1px solid #38bdf8; color: #38bdf8; }
        .btn-graph:hover { background: #38bdf8; color: #0f172a; }
        .login-footer {
    width: 100%;
    background: rgb(125, 125, 143);
    color: white;
    text-align: center;
    padding: 15px;
}

    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-custom">
    <div class="container">
        <a class="navbar-brand fw-bold text-white" href="#"><i class="fa-solid fa-chart-pie text-info me-2"></i>STOCK<span class="text-info">PRO</span></a>
        <div class="navbar-nav ms-auto">
            <a class="nav-link mx-2" href="index.html">HOME</a>
            <a class="nav-link mx-2" href="market.html">MARKET</a>
            <a class="nav-link mx-2" href="invest.html">INVEST</a>
            <a class="nav-link mx-2" href="reports.html">REPORTS</a>
            <button class="btn btn-outline-light btn-sm ms-3" onclick="logout()">LOGOUT</button>
        </div>
    </div>
</nav>

<div class="ticker-wrap">
    <marquee scrollamount="7" onmouseover="this.stop()" onmouseout="this.start()">
        <span class="ticker-item">NIFTY 50 <b class="down">23,740 (-1.07%)</b></span>
        <span class="ticker-item">SENSEX <b class="down">78,120 (-0.85%)</b></span>
        <span class="ticker-item">RELIANCE <b class="up">2,450 (+0.4%)</b></span>
        <span class="ticker-item">TCS <b class="up">3,602 (+1.1%)</b></span>
        <span class="ticker-item">HDFC BANK <b class="down">1,420 (-2.3%)</b></span>
        <span class="ticker-item">INFY <b class="up">1,505 (+0.2%)</b></span>
        <span class="ticker-item">ZOMATO <b class="up">185 (+4.5%)</b></span>
        <span class="ticker-item">ADANI ENT <b class="down">2,910 (-1.2%)</b></span>
    </marquee>
</div>

<div class="container mb-5">
    <div class="table-container shadow">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4 class="m-0"><i class="fa-solid fa-list-ul text-info me-2"></i>Market Watchlist</h4>
            <div class="input-group w-25">
                <span class="input-group-text bg-dark border-secondary text-light"><i class="fa-solid fa-magnifying-glass"></i></span>
                <input type="text" class="form-control bg-dark border-secondary text-white" placeholder="Search stocks...">
            </div>
        </div>

        <table class="table table-hover">
            <thead>
                <tr>
                    <th>Company</th>
                    <th>Price</th>
                    <th>Change</th>
                    <th>Volume</th>
                    <th>Actions</th>
                    <th>Analysis</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <div class="d-flex align-items-center">
                            <div class="stock-logo"><i class="fa-solid fa-oil-well text-warning"></i></div>
                            <div><b>Reliance Industries</b><br><small class="text-secondary">Energy</small></div>
                        </div>
                    </td>
                    <td>₹2,450.00</td>
                    <td class="up">+0.51%</td>
                    <td>1.2M</td>
                    <td>
                        <button class="btn btn-action btn-buy" onclick="buy('Reliance')">Buy</button>
                        <button class="btn btn-action btn-sell" onclick="sell('Reliance')">Sell</button>
                    </td>
                    <td><button class="btn btn-action btn-graph" onclick="graph('Reliance')"><i class="fa-solid fa-chart-area"></i></button></td>
                </tr>

                <tr>
                    <td>
                        <div class="d-flex align-items-center">
                            <div class="stock-logo"><i class="fa-solid fa-laptop-code text-primary"></i></div>
                            <div><b>TCS</b><br><small class="text-secondary">IT Services</small></div>
                        </div>
                    </td>
                    <td>₹3,602.15</td>
                    <td class="up">+1.15%</td>
                    <td>850K</td>
                    <td>
                        <button class="btn btn-action btn-buy" onclick="buy('TCS')">Buy</button>
                        <button class="btn btn-action btn-sell" onclick="sell('TCS')">Sell</button>
                    </td>
                    <td><button class="btn btn-action btn-graph" onclick="graph('TCS')"><i class="fa-solid fa-chart-area"></i></button></td>
                </tr>

                <tr>
                    <td>
                        <div class="d-flex align-items-center">
                            <div class="stock-logo"><i class="fa-solid fa-building-columns text-info"></i></div>
                            <div><b>HDFC Bank</b><br><small class="text-secondary">Banking</small></div>
                        </div>
                    </td>
                    <td>₹1,420.00</td>
                    <td class="down">-2.30%</td>
                    <td>4.5M</td>
                    <td>
                        <button class="btn btn-action btn-buy" onclick="buy('HDFC')">Buy</button>
                        <button class="btn btn-action btn-sell" onclick="sell('HDFC')">Sell</button>
                    </td>
                    <td><button class="btn btn-action btn-graph" onclick="graph('HDFC')"><i class="fa-solid fa-chart-area"></i></button></td>
                </tr>

                <tr>
                    <td>
                        <div class="d-flex align-items-center">
                            <div class="stock-logo"><i class="fa-solid fa-motorcycle text-danger"></i></div>
                            <div><b>Tata Motors</b><br><small class="text-secondary">Automobile</small></div>
                        </div>
                    </td>
                    <td>₹985.40</td>
                    <td class="up">+3.20%</td>
                    <td>2.1M</td>
                    <td>
                        <button class="btn btn-action btn-buy" onclick="buy('Tata Motors')">Buy</button>
                        <button class="btn btn-action btn-sell" onclick="sell('Tata Motors')">Sell</button>
                    </td>
                    <td><button class="btn btn-action btn-graph" onclick="graph('Tata Motors')"><i class="fa-solid fa-chart-area"></i></button></td>
                </tr>

                <tr>
                    <td>
                        <div class="d-flex align-items-center">
                            <div class="stock-logo"><i class="fa-solid fa-utensils text-warning"></i></div>
                            <div><b>Zomato</b><br><small class="text-secondary">E-Commerce</small></div>
                        </div>
                    </td>
                    <td>₹185.00</td>
                    <td class="up">+4.50%</td>
                    <td>12M</td>
                    <td>
                        <button class="btn btn-action btn-buy" onclick="buy('Zomato')">Buy</button>
                        <button class="btn btn-action btn-sell" onclick="sell('Zomato')">Sell</button>
                    </td>
                    <td><button class="btn btn-action btn-graph" onclick="graph('Zomato')"><i class="fa-solid fa-chart-area"></i></button></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<div class="login-footer">
   © 24951A12C7 - YuvaSai 2026 All Rights Reserved
</div>

<script>
    function logout(){ window.location.href="login.html"; }
    function buy(s){ alert("Confirm purchase order for " + s + "?"); }
    function sell(s){ alert("Confirm sell order for " + s + "?"); }
    function graph(s){ localStorage.setItem("stock", s); window.location.href="graph.html"; }
</script>

</body>
</html>
