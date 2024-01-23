import vweb

struct App {
    vweb.Context
}

fn main() {
    mut app := App{}
    vweb.run(app, 8080)
}

pub fn (mut app App) index() vweb.Result {
    return app.html(login_page())
}

pub fn (mut app App) register() vweb.Result {
    return app.html(register_page())
}

fn login_page() string {
    return '
    <!DOCTYPE html>
    <html>
    <head>
        <title>Login Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <h2 class="text-center">Login</h2>
                    <form action="/login" method="post" class="mt-4">
                        <div class="form-group">
                            <input type="text" class="form-control" name="username" placeholder="Username" required>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" name="password" placeholder="Password" required>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Login</button>
                    </form>
                    <p class="text-center mt-3">
                        Don\'t have an account? <a href="/register">Register here</a>
                    </p>
                </div>
            </div>
        </div>
    </body>
    </html>'
}

fn register_page() string {
    return '
    <!DOCTYPE html>
    <html>
    <head>
        <title>Register Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <h2 class="text-center">Register</h2>
                    <form action="/register" method="post" class="mt-4">
                        <div class="form-group">
                            <input type="text" class="form-control" name="username" placeholder="Username" required>
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control" name="email" placeholder="Email" required>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" name="password" placeholder="Password" required>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Register</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
    </html>'
}
