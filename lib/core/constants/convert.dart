

String convertIntoPaymentMethode(int paymentMethode){

  if(paymentMethode==0){
    return "Cache";
  }

  return "Electronic";

}

String convertIntoOrderStatus(val){
  if(val==0||val==1){
    return "pending";
  }else if(val==2){
    return "preparing";
  }
  else if(val==3){
    return "onTheWay";
  }else if(val==-3){
    return "on receiving";
  }
  return "Done";
}