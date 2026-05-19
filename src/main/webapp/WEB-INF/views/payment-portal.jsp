<!DOCTYPE html>
<html lang="en">

<head>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/dashboard.css">

    <meta charset="UTF-8">

    <title>Payment Portal</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/payment.css">

</head>
<script>
function toggleSidebar(){

    document
        .getElementById("sidebar")
        .classList
        .toggle("collapsed");

    document
        .getElementById("mainContent")
        .classList
        .toggle("expand-content");
}
</script>

<body>

<div class="payment-page">

    <!-- LEFT -->

    <div class="payment-left">

        <h1>
            Premium Membership
        </h1>

        <p>
            Complete your membership payment securely.
        </p>

        <!-- CARD -->

        <div class="credit-card">

            <div class="card-chip"></div>

            <div class="card-number"
                 id="cardNumberPreview">

                #### #### #### ####

            </div>

            <div class="card-bottom">

                <div>

                    <span>
                        Card Holder
                    </span>

                    <h3 id="cardHolderPreview">
                        YOUR NAME
                    </h3>

                </div>

                <div>

                    <span>
                        Expires
                    </span>

                    <h3 id="expiryPreview">
                        00/00
                    </h3>

                </div>

            </div>

        </div>

    </div>

    <!-- RIGHT -->

    <div class="payment-right">

        <form id="paymentForm"
              action="/payments/add"
              method="post">

            <h2>
                Payment Details
            </h2>



            <input type="text"
                   id="cardNumber"
                   placeholder="Card Number"
                   maxlength="19"
                   required>

            <input type="text"
                   id="cardHolder"
                   placeholder="Card Holder Name"
                   required>

            <div class="row">

                <input type="text"
                       id="expiry"
                       placeholder="MM/YY"
                       maxlength="5"
                       required>

                <input type="password"
                       placeholder="CVV"
                       maxlength="3"
                       required>

            </div>

            <input type="text"
                   name="amount"
                   value="${selectedAmount}"
                   placeholder="Amount"
                   readonly
                   required>

            <input type="hidden"
                   name="description"
                   value="${description}">

            <input type="hidden"
                   name="date"
                   id="dateField">

            <button type="submit">

                Pay Now

            </button>

        </form>

    </div>

</div>

<!-- SUCCESS POPUP -->

<div class="success-popup"
     id="successPopup">

    ✔ Payment Successful

</div>

<script>

const cardNumber = document.getElementById('cardNumber');

const cardHolder = document.getElementById('cardHolder');

const expiry = document.getElementById('expiry');

cardNumber.addEventListener('input',()=>{

    document.getElementById(
        'cardNumberPreview'
    ).innerText = cardNumber.value || '#### #### #### ####';
});

cardHolder.addEventListener('input',()=>{

    document.getElementById(
        'cardHolderPreview'
    ).innerText =
        cardHolder.value || 'YOUR NAME';
});

expiry.addEventListener('input',()=>{

    document.getElementById(
        'expiryPreview'
    ).innerText =
        expiry.value || '00/00';
});

document.getElementById(
    'dateField'
).value =new Date().toISOString().split('T')[0];

document.getElementById(
    'paymentForm'
).addEventListener('submit',(e)=>{

    document.getElementById(
        'successPopup'
    ).style.display='block';
});

 const cardInput = document.getElementById("cardNumber");

    cardInput.addEventListener("input", function () {

        let value = this.value.replace(/\D/g, "");

        value = value.substring(0, 16);

        value = value.replace(/(.{4})/g, "$1 ").trim();

        this.value = value;
    });

</script>

</body>
</html>