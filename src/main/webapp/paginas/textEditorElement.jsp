<!-- Include Quill's JavaScript -->
<script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>

<script>
    // Initialize Quill
    let quill = new Quill('#descriptionEditor', {
        theme: 'snow', // Snow theme for a clean interface,
    });

    let descriptionContent = document.getElementById('descriptionContent');

    loadDescriptionContent();

    function loadDescriptionContent() {
        if (descriptionContent.value !== null) {
            quill.root.innerHTML = removeHtmlTags(descriptionContent.value);
        }
    }

    function removeHtmlTags(input) {
        let doc = new DOMParser().parseFromString(input, 'text/html');
        return doc.body.textContent || "";
    }

    function updateDescriptionContent() {
        descriptionContent.value = quill.root.innerHTML;
    }
</script>
