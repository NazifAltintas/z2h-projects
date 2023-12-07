from flask import Flask, render_template, request, redirect, url_for, flash

app = Flask(__name__)
app.secret_key = 'your_secret_key'

products = [
    {"id": 1, "name": "Product 1", "description": "Description for Product 1", "price": 10.0},
    {"id": 2, "name": "Product 2", "description": "Description for Product 2", "price": 20.0},
    {"id": 3, "name": "Product 3", "description": "Description for Product 3", "price": 30.0},
]

cart = []

@app.route('/')
def index():
    return render_template('index.html', products=products)

@app.route('/add_to_cart/<int:product_id>')
def add_to_cart(product_id):
    product = next((p for p in products if p['id'] == product_id), None)
    if product:
        cart.append(product)
        flash(f"{product['name']} added to the cart.", 'success')
    else:
        flash("Product not found.", 'danger')
    return redirect(url_for('index'))

@app.route('/cart')
def view_cart():
    return render_template('cart.html', cart=cart)

@app.route('/checkout')
def checkout():
    # Simulate order placement
    cart.clear()
    flash("Order placed successfully. Thank you for shopping!", 'success')
    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(debug=True)
