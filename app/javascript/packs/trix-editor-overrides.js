// app/javascript/trix-editor-overrides.js
// window.addEventListener("trix-file-accept", function(event) {
//   event.preventDefault()
//   alert("File attachment not supported!")
// })

window.addEventListener("trix-file-accept", function(event) {
  const acceptedTypes = ['image/jpeg', 'image/png']
  if (!acceptedTypes.includes(event.file.type)) {
    event.preventDefault()
    alert("Only support attachment of jpeg or png files")
  }
})

// Only whitelist certain files based size:
// app/javascript/trix-editor-overrides.js
// window.addEventListener("trix-file-accept", function(event) {
  // const maxFileSize = 1024 * 1024 // 1MB 
  // if (event.file.size > maxFileSize) {
    // event.preventDefault()
    // alert("Only support attachment files upto size 1MB!")
  // }
// })
