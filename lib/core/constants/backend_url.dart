

const String serverLink="http://192.168.1.10/ecommerce/user";
const String uploadLink="$serverLink/upload";


//#################         auth    #########################################################################
const String authLink="$serverLink/auth";
const String signInLink="$authLink/signIn.php";
const String signUpLink="$authLink/signUp.php";
const String verifyCodeLink="$authLink/verify_code.php";
const String checkEmailLink="$authLink/check_email.php";
const String resetPasswordLink="$authLink/reset_password.php";





//#################         home    #########################################################################
const String homeLink="$serverLink/home/home.php";


//#################         categories    #########################################################################
const String categoriesLink="$serverLink/categories";
const String getCategoriesLink="$categoriesLink/get.php";
const String searchCategoryLink="$categoriesLink/search.php";




//#################         products    #########################################################################
const String productsLink="$serverLink/products";
const String getProductsLink="$productsLink/get.php";
const String getProductDetailsLink="$productsLink/get_details.php";
const String searchProductsLink="$productsLink/search.php";
const String getTopSellingProductsLink="$productsLink/top_selling.php";
const String getOfferProductsLink="$serverLink/offers/get.php";


//#################         favorite    #########################################################################
const String favoriteProductsLink="$serverLink/favorite";
const String getFavoriteProductsLink="$favoriteProductsLink/get.php";
const String addProductToFavoriteLink="$favoriteProductsLink/add.php";
const String removeProductFromFavoriteLink="$favoriteProductsLink/remove.php";


//#################         address    #########################################################################
const String addressLink="$serverLink/address";
const String getAddressesLink="$addressLink/get.php";
const String getAddressDetailsLink="$addressLink/get_details.php";
const String addAddressLink="$addressLink/add.php";
const String deleteAddressLink="$addressLink/delete.php";
const String updateAddressLink="$addressLink/update.php";
const String getShopAddressLink="$addressLink/get_shop_address.php";


//#################         cart    #########################################################################
const String cartLink="$serverLink/cart";
const String cartRemoveLink="$cartLink/remove.php";
const String cartAddLink="$cartLink/add.php";
const String cartUpdateLink="$cartLink/update.php";
const String cartDiscountLink="$cartLink/discount.php";
const String cartGetLink="$cartLink/get.php";

//#################         profile    #########################################################################
const String profileLink="$serverLink/profile";
const String updateUserNameLink="$profileLink/update_user_name.php";
const String getUserDataLink="$profileLink/get.php";
const String addUserImageLink="$profileLink/add_image.php";
const String updateUserImageLink="$profileLink/update_image.php";
const String deleteUserImageLink="$profileLink/delete_image.php";


//#################         orders    #########################################################################
const String ordersLink="$serverLink/orders";
const String getOrdersLink="$ordersLink/get.php";
const String getOrderDetailsLink="$ordersLink/get_details.php";
const String deleteOrderLink="$ordersLink/delete.php";
const String getArchivedOrdersLink="$ordersLink/get_archived.php";
const String rateOrderLink="$ordersLink/rating.php";


//#################         check out    #########################################################################
const String checkOutLink="$ordersLink/checkout.php";
const String sendOrderLink="$ordersLink/send.php";
const String checkCouponLink="$ordersLink/check_coupon.php";

//#################         coupons     #########################################################################
const String couponsLink="$serverLink/coupons";
const String getCouponsLink="$couponsLink/get.php";

//#################         notifications     #########################################################################
const String notificationsLink="$serverLink/notifications";
const String getNotificationsLink="$notificationsLink/get.php";
