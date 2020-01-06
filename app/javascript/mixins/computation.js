const computationMixin = {
  methods: {
    compute() {
      // SELECT ONLY VALID FIELDS
      const fields = this.invoice_attr.fields_attributes
                              .filter(field => field._destroy !== '1')

      // IF ANY VALID FIELDS COMPUTE HT TTC & VAT
      if (fields.length > 0) {
        this.invoice_attr.total_ht = fields.map(
          field => parseInt(field.unit_price, 10) * parseInt(field.quantity, 10)
          ).reduce((acc, val) => acc + val)

        this.invoice_attr.total_tva = (
              this.invoice_attr.total_ht / 100) *
              parseInt(this.invoice_attr.tva.split('%')[0], 10)

        this.invoice_attr.total_ttc = this.invoice_attr.total_ht + this.invoice_attr.total_tva
      } else {
      // ELSE SET TOTAL TO ZERO
        this.invoice_attr.total_ttc = 0;
      }
    }
  }
}

export { computationMixin }
