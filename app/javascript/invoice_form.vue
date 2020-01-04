<template>
  <div class="container form-wrapper">
    <h2 class="title">Invoice</h2>
    <div class="field">
      <label class="label">Invoice Reference</label>
      <div class="control">
        <input class="input"
               type="text"
               placeholder="Invoice Reference"
               v-model="invoice_attr.reference">
      </div>
      <p class="help">This is a help text</p>
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
      <div v-if="field._destroy == '1'">
        <div class="disabled-field">
          <fieldset disabled>

          <div class="field">
            <div class="control">
              <input class="input" type="text" :placeholder="field.reference">
            </div>
          </div>

          </fieldset>
          <button class="undo-btn button is-warning" @click="undo(index)">O</button>
        </div>
      </div>

      <div v-else class="columns">
        <div class="column">
          <div class="field">
            <label class="label">Field Reference</label>
            <div class="control">
              <input class="input"
                     type="text"
                     placeholder="Text input"
                     v-model="field.reference">
            </div>
          </div>
        </div>

        <div class="column">
          <div class="field">
            <label class="label">Quantity</label>
            <div class="control">
              <input class="input"
                     type="text"
                     placeholder="Text input"
                     v-model="field.quantity">
            </div>
          </div>
        </div>

        <button class="button is-danger" @click="removeItem(index)">X</button>

      </div>

    </div>

    <button class="button is-primary field-btn" @click="addItem">Add Item</button>

    <hr>

    <button class="button is-primary" @click="save">Save Invoice</button>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        marked: 0,
        invoice_attr: {
          reference: this.invoice.reference,
          description: this.invoice.description,
          fields_attributes: this.fields
        }
      }
    },
    props: ['invoice', 'fields'],
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
    }
  }
</script>

<style scoped lang="scss">
  .form-wrapper {
    margin-top: 3em;
    margin-bottom: 3em;

    #marked {
      margin-bottom: 20px;
    }

    .columns {
      position: relative;

      .is-danger {
        position: absolute;
        top: 45%;
        right: -40px;
      }
    }

    .disabled-field {
      position: relative;
      margin-top: 30px;

      button {
        position: absolute;
        top: 0;
        right: -50px;
      }
    }

    .field-btn {
      margin-top: 20px;
    }
  }
</style>
