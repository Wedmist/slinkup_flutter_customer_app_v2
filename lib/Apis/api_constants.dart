// const String dummytoken =
//     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7InVzZXJfaWQiOjE2ODQ3NzUyODMyNDMsInByb2ZpbGVfaW1nIjpudWxsLCJuYW1lIjoiYWJjZCIsImVtYWlsX2lkIjoiYWJAZ21haWwuY29tIiwibW9iaWxlX25vIjo3ODk0NTYxMjM1LCJnZW5kZXIiOiJNYWxlIiwiT1RQIjo5NjE0LCJwYXNzd29yZCI6IiQyYiQxMCRaWDZ5UU41MGQ0WUtwU0E1cFhQSzRlQXZidG92ZVRVWEg0YmwxcHhSRmhKU092b1EvTHFLRyIsInNwb2tlbl9sYW5ndWFnZSI6IlsxNjg0NzUwNjY2NTE4XSIsIndvcmtfY2F0ZWdvcnkiOjE2ODQ4NjIzODE3NDksImN1c3RvbWVyX3NlcnZpY2UiOjEsImRvY19wYW4iOm51bGwsImRvY19hYWRoYXJfZnJvbnQiOm51bGwsImRvY19hYWRoYXJfYmFjayI6bnVsbCwiZG9jX3ZhY2NpbmF0aW9uX2NlcnRpZmljYXRlIjpudWxsLCJiYW5rX2RldGFpbHMiOm51bGwsImxvY2F0aW9uX2xhdCI6bnVsbCwibG9jYXRpb25fbG9uZyI6bnVsbCwic2VydmljZV9hcmVhIjpudWxsLCJyZWZlcmFsX2lkIjoiQTY2M1E1MTNKNzAwIiwidXNlcl9yb2xlIjoidXNlciIsInVzZXJfc3RhdHVzIjoicGVuZGlpbmciLCJmbGFnIjoicHJvdmlkZXIiLCJjZWF0ZWRfYXQiOiIyMDIzLTA1LTIyVDE3OjA4OjAzLjAwMFoiLCJ1cGRhdGVkX2F0IjoiMjAyMy0wNi0xMlQxNzoxMzo1Mi4wMDBaIn0sImlhdCI6MTY4NjU5MDA0NH0.4e8QRFQvptMqrYEpj90GKePhoqu7hCdOAWrbve9poJ4";
// const String apiBaseUrl = "http://52.66.210.7:4137/";
const String apiBaseUrl = "http://164.52.223.36/";

///

const String apiSendOtp = "api/user_details/send_otp";
const String apiUserExists = "api/user_details/user_exits";
const String apiEncryptPassword = "api/user_details/encrypt_password";

///
const String apiVerifyOtp = "api/user_details/verify_otp";
const String apiLogin = "api/user_details/login";
const String apiUserRegistration = "api/user_details/registration";

///
const String getHomeScreenData = "api/customer/get_home_screen_data";
const String getAllCategories = "api/customer/get_all_categories";
const String getServicesByCategory = "api/customer/get_survices_by_category/";

///
const String getSimilarServicesById = "api/customer/get_similar_services_by_name/";
const String getSubServiceWithProviderDetails = "api/customer/get_sub_service_with_provider_details/";
const String getSubserviceByUserIdAndServiceId = "api/customer/get_sub_services_by_user_id_and_service_id";

/// add to cart button
const String addTocartButton = "api/order/add_to_cart_plus_button/";
const String addToCartMinusButton = "api/order/add_to_cart_minus_button";
const String addToCart = 'api/order/add_to_cart';

/// cart view
const String getCartDataApi = "api/order/get_cart_data/";

///booking summer
const String getBookingSummery = "api/order/create_booking_summary";

/// place order
const String palceOrderApi = "api/order/place_order";

/// Address apis
const String getAllAddressApi = "api/customer/get_customer_all_address/";
const String addANewAddressApi = "api/customer/add_a_new_address_to_customer_user";
const String editAddressApi = "api/customer/update_existing_address_for_customer_user";
const String deleteAddressApi = "api/customer/delete_customer_address_for_customer_user/";
