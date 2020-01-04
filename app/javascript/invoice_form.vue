<template>
  <div class="container form-wrapper">
    <h2 class="title">Invoice</h2>

    <div class="columns">
      <div class="column is-2">
        <div class="field">
          <label class="label">Invoice Number</label>
          <div class="control">
            <input class="input"
                   type="text"
                   placeholder="Invoice Number"
                   v-model="invoice_attr.number">
          </div>
        </div>
      </div>
      <div class="column">
        <div class="field">
          <label class="label">Invoice Reference</label>
          <div class="control">
            <input class="input"
                   type="text"
                   placeholder="Invoice Reference"
                   v-model="invoice_attr.reference">
          </div>
        </div>
      </div>
    </div>

    <div class="field">
      <label class="label">Invoice Description</label>
      <div class="control">
        <textarea class="textarea"
                  placeholder="e.g. Hello world"
                  v-model="invoice_attr.description">
        </textarea>
      </div>
    </div>

    <hr>
    <h2 class="title">Items</h2>
    <p id="marked" v-if="marked > 0">{{ marked }} Marked to be destroyed</p>

    <div v-for="(field, index) in invoice_attr.fields_attributes">

    <field :field="field" :index="index" />

    </div>

    <button class="button is-primary field-btn" @click="addItem">Add Item</button>

    <hr>

    <div class="columns">
      <div class="column">
        <button class="button is-primary is-medium" @click="save">Save Invoice</button>
      </div>
      <div class="column">
        <div class="field is-horizontal" id="total-field">
          <div class="field-label is-normal">
            <label class="label">Total<br>TTC</label>
          </div>
          <div class="field-body">
            <div class="field">
              <p class="control has-icons-right">
                <input class="input is-medium" v-model="invoice_attr.total">
                <span class="icon is-small is-right">
                  <i class="fas fa-euro-sign"></i>
                </span>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>




  </div>
</template>

<script>
  import field from './field.vue'

  export default {
    data() {
      return {
        marked: 0,
        invoice_attr: {
          reference: this.invoice.reference,
          description: this.invoice.description,
          number: this.invoice.number,
          total: null,
          fields_attributes: this.fields
        }
      }
    },
    props: ['invoice', 'fields'],
    components: {
      field
    },
    methods: {
      addItem() {
        this.invoice_attr.fields_attributes.push({
          reference: '',
          quantity: 1,
          _destroy: null
        })
      },
      removeItem(index) {
        if (!this.invoice_attr.fields_attributes[index].id) {
          this.invoice_attr.fields_attributes.splice(index, 1)
        } else {
          this.invoice_attr.fields_attributes[index]._destroy = '1'
          this.marked += 1
        }
      },
      undo(index) {
        this.invoice_attr.fields_attributes[index]._destroy = '0'
        this.marked -= 1
      },
      compute() {
        const validFields = this.invoice_attr.fields_attributes
                                .filter(field => field._destroy !== '1')
        if (validFields.length > 0) {
          this.invoice_attr.total = validFields.map(field => parseInt(field.unit_price, 10) * parseInt(field.quantity, 10)).reduce((acc, val) => acc + val)
        } else {
          this.invoice_attr.total = 0;
        }
      },
      save() {
        if (!this.invoice.id) {
          this.$http.post('/invoices', { invoice: this.invoice_attr })
            .then(this.succes, this.reject)
        } else {
          this.$http.put(`/invoices/${this.invoice.id}`, { invoice: this.invoice_attr })
            .then(this.succes, this.reject)
        }
      },
      succes(response) {
        console.log(response)
      },
      reject(response) {
        console.log(response)
      }
    },
    beforeMount() {
      this.compute();
    }
  }
</script>

<style scoped lang="scss">
  .form-wrapper {
    margin-top: 3em;
    margin-bottom: 3em;

    #marked {
      margin-bottom: 10px;
    }

    .field-btn {
      margin-top: 20px;
    }

    #total-field {
      float: right;
    }
  }
</style>
