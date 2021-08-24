class GSTModel {
   String? GSTIN;
   String? name;
   String? status;
   String? address;
   String? tax_payer_type;
   String? business_type;
   String? date_of_registration;
   String? id;

  GSTModel(
      { this.name,
       this.address,
       this.business_type,
       this.date_of_registration,
       this.GSTIN,
       this.status,
       this.tax_payer_type,
      this.id});

   GSTModel.fromJson(Map json) {

      GSTIN= json['GSTIN'];
      name= json['name'];
      status= json['status'];
      address= json['address'];
      tax_payer_type= json['tax payer type'];
      business_type= json['business type'];
      date_of_registration= json['date of registration'];
      id= json['GSTIN'];

  }
}
