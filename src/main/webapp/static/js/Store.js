if (document.readyState == 'loading') {
    document.addEventListener('DOMContentLoaded', ready)
} else {
    ready()
}

function ready() {
    var removeCartItemButtons = document.getElementsByClassName('btn-danger')
    for (var i = 0; i < removeCartItemButtons.length; i++) {
        var button = removeCartItemButtons[i]
        button.addEventListener('click', removeCartItem)
    }

    var quantityInputs = document.getElementsByClassName('cart-quantity-input')
    for (var i = 0; i < quantityInputs.length; i++) {
        var input = quantityInputs[i]
        input.addEventListener('change', quantityChanged)
    }

    var addToCartButtons = document.getElementsByClassName('shop-item-button')
        for (var i = 0; i < addToCartButtons.length; i++) {
            var button = addToCartButtons[i]
            button.addEventListener('click', addToCartClicked)
        }
}

function removeCartItem(event) {
    var buttonClicked = event.target
    buttonClicked.parentElement.parentElement.remove()
    updateCartTotal()
}

function quantityChanged(event) {
    var input = event.target
    if (isNaN(input.value) || input.value <= 0) {
        input.value = 1
    }
    updateCartTotal()
}

function addToCartClicked(event) {
    var button = event.target
    var shopItem = button.parentElement
    var bottom_description = document.getElementById('bottom')
    var bottom_description_text = bottom_description[bottom_description.selectedIndex].text
    var topping_description = document.getElementById('topping')
    var topping_description_text = topping_description[topping_description.selectedIndex].text
    var quantity = document.getElementById('quantity').value
    console.log(bottom_description)
    addItemToCart(bottom_description_text, topping_description_text, quantity)
}

function addItemToCart(bottom, topping, quantity) {
    var cartRow = document.createElement('div')
    cartRow.classList.add('cart-row')
    var cartItem = document.getElementsByClassName('cart-items')[0]
    var cartRowContents =`
        <div className="cart-item cart-column">
            <span className="cart-bottom-description">${bottom}</span>
            <span className="cart-topping-description">${topping}</span>
        </div>
        <span className="cart-price cart-column">$19.99</span>
        <div className="cart-quantity cart-column">
        <input className="cart-quantity-input" type="number" value="1">
            <button className="btn btn-danger" type="button">REMOVE</button>
        </div>`
    cartRow.innerHTML = cartRowContents
    cartItem.append(cartRow)
    cartRow.getElementsByClassName('btn-danger')[0].addEventListener('click', removeCartItem)
    cartRow.getElementsByClassName('cart-quantity-input')[0].addEventListener('change',quantityChanged)
    updateCartTotal()
}


function updateCartTotal()
    {
        var cartItemContainer = document.getElementsByClassName('cart-items')[0]
        var cartRows = cartItemContainer.getElementsByClassName('cart-row')
        var total = 0
        for (var i = 0; i < cartRows.length; i++) {
            var cartRow = cartRows[i]
            var priceElement = cartRow.getElementsByClassName('cart-price')[0]
            var quantityElement = cartRow.getElementsByClassName('cart-quantity-input')[0]
            var price = parseFloat(priceElement.innerText.replace('$', ''))
            var quantity = quantityElement.value
            total += (price * quantity)
        }
        total = Math.round(total * 100) / 100
        document.getElementsByClassName('cart-total-price')[0].innerText = '$' + total
    }