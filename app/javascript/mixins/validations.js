const validationsMixin = {
  methods: {
    validations() {
      const emptyFields = Array.from(document.querySelectorAll('.required')).filter(field => field.value === '')
      const requiredCount = Array.from(document.querySelectorAll('.required')).length
      const validCount = Array.from(document.querySelectorAll('.is-success')).length

      if (validCount === requiredCount) {
        return true
      } else {
        emptyFields.forEach((field) => {
          field.classList.add('is-danger')
          field.classList.remove('is-success')
        })
        return false
      }
    },
    validateField(item) {
      const target = item.target ? item.target : item
      const regex = new RegExp(target.dataset.regex)

      if (target.value === '') {
        target.classList.remove('is-success')
        target.classList.remove('is-warning')
        target.parentNode.querySelector('.help').innerHTML = ''
        return false
      }

      if ((regex).test(target.value)) {
        target.classList.remove('is-warning')
        target.classList.remove('is-danger')
        target.classList.add('is-success')
        target.parentNode.querySelector('.help').innerHTML = ''
      } else {
        target.classList.remove('is-success')
        target.classList.remove('is-danger')
        target.classList.add('is-warning')
        target.parentNode.querySelector('.help').innerHTML = target.dataset.help
      }
    }
  }
}

export { validationsMixin }
