<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PowerFit - Edit Payment</title>
    <link rel="stylesheet" href="/css/dashboard.css">
</head>
<body>

<div class="pf-wrap">

    <!-- Navbar -->
    <div class="pf-nav">
        <span class="pf-logo">Power<span>Fit</span></span>
        <ul class="pf-nav-tabs">
            <li><a href="/dashboard">Dashboard</a></li>
            <li><a href="/payments" class="active">Payments</a></li>
        </ul>
    </div>

    <!-- Page header -->
    <div class="pf-hero">
        <h2>💳 Edit <span>Payment</span></h2>
        <p>Update the payment details below</p>
    </div>

    <!-- Edit payment form -->
    <div style="padding:24px; max-width:600px;">
        <div class="pf-card">
            <h4 style="margin-bottom:20px;">Edit Payment Details</h4>

            <form method="post" action="/payments/edit/${payment.id}">

                <div style="margin-bottom:16px;">
                    <label style="font-size:12px; color:#888; display:block; margin-bottom:6px;">
                        Amount ($)
                    </label>
                    <input type="number" name="amount"
                           value="${payment.amount}"
                           step="0.01" required
                           style="width:100%; padding:10px 14px; background:#1a1a1a;
                                  border:1px solid #222; border-radius:8px; color:#fff;
                                  font-size:13px; outline:none;"/>
                </div>

                <div style="margin-bottom:16px;">
                    <label style="font-size:12px; color:#888; display:block; margin-bottom:6px;">
                        Description
                    </label>
                    <input type="text" name="description"
                           value="${payment.description}"
                           required
                           style="width:100%; padding:10px 14px; background:#1a1a1a;
                                  border:1px solid #222; border-radius:8px; color:#fff;
                                  font-size:13px; outline:none;"/>
                </div>

                <div style="margin-bottom:24px;">
                    <label style="font-size:12px; color:#888; display:block; margin-bottom:6px;">
                        Status
                    </label>
                    <select name="status" required
                            style="width:100%; padding:10px 14px; background:#1a1a1a;
                                   border:1px solid #222; border-radius:8px; color:#fff;
                                   font-size:13px; outline:none;">
                        <option value="Pending" ${payment.status == 'Pending' ? 'selected' : ''}>
                            Pending
                        </option>
                        <option value="Paid" ${payment.status == 'Paid' ? 'selected' : ''}>
                            Paid
                        </option>
                    </select>
                </div>

                <div style="display:flex; gap:12px;">
                    <button type="submit"
                            style="flex:1; padding:11px; background:#1a6dff; color:#fff;
                                   border:none; border-radius:8px; font-size:14px; cursor:pointer;">
                        Update Payment
                    </button>
                    <a href="/payments"
                       style="flex:1; padding:11px; background:#1a1a1a; color:#aaa;
                              border:1px solid #222; border-radius:8px; font-size:14px;
                              cursor:pointer; text-align:center; text-decoration:none;">
                        Cancel
                    </a>
                </div>

            </form>
        </div>
    </div>
</div>

</body>
</html>