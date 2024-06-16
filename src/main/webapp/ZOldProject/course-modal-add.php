<div class="modal" id="modalAddCourse"
    <?php if (!isset($_GET['open-modal'])) echo "hidden"; ?>>
    <div class="modal-background" onclick="toggleModalAddCourse()">
    </div>

    <div class="modal-content">
        <form action="HandlerCourse.php" method="post">
            <h1>Cadastrar Curso</h1>

            <?php
            $name = $category = $price = $description = '';

            if (isset($_SESSION['form_data'])) {
                $formData = $_SESSION['form_data'];
                $name = $formData['name'];
                $category = $formData['category'];
                $price = $formData['price'];
                $description = $formData['description'];
                unset($_SESSION['form_data']);
            }
            ?>

            <!-- DISPLAY SERVER MESSAGES -->
            <?php if (!isset($_GET['success'])) include 'displayMessageIfExists.php' ?>

            <div class="add-inputs">
                <label class="blackOpacity">
                    <input placeholder="Nome do Curso" type="text" name="name"
                           value="<?php echo htmlspecialchars($name); ?>">
                </label>

                <label for="category" hidden="hidden"></label>
                <select id="category" class="custom-select" name="category">
                    <option value="0" selected>Escolha a categoria</option>
                    <option value="8" <?php if ($category == 8) echo 'selected' ?>>Banco de Dados</option>
                    <option value="10" <?php if ($category == 10) echo 'selected' ?>>Ciência de Dados</option>
                    <option value="11" <?php if ($category == 11) echo 'selected' ?>>Cloud Computing</option>
                    <option value="13" <?php if ($category == 13) echo 'selected' ?>>Desenvolvimento de Aplicativos Móveis</option>
                    <option value="7" <?php if ($category == 7) echo 'selected' ?>>Desenvolvimento Web</option>
                    <option value="1" <?php if ($category == 1) echo 'selected' ?>>Diversos</option>
                    <option value="5" <?php if ($category == 5) echo 'selected' ?>>Gestão</option>
                    <option value="2" <?php if ($category == 2) echo 'selected' ?>>História</option>
                    <option value="6" <?php if ($category == 6) echo 'selected' ?>>Matemática</option>
                    <option value="3" <?php if ($category == 3) echo 'selected' ?>>Programação</option>
                    <option value="4" <?php if ($category == 4) echo 'selected' ?>>Robótica</option>
                    <option value="9" <?php if ($category == 9) echo 'selected' ?>>Segurança da Informação</option>
                    <option value="12" <?php if ($category == 12) echo 'selected' ?>>Sistemas Operacionais</option>
                </select>

                <label class="blackOpacity">
                    <input type="number" step="0.5" min="0" name="price" id="price" placeholder="(€) Preço"
                           value="<?php if ($price > 0) echo htmlspecialchars($price); ?>">
                </label>

                <div>
                    <input type="hidden" id="descriptionContent" name="description"
                           value="<?php echo htmlspecialchars($description); ?>">
                    <div id="descriptionEditor"></div>
                </div>

                <div>
                    <input onclick="updateDescriptionContent()" onsubmit="updateDescriptionContent()" class="mb10"
                           type="submit" value="ADICIONAR">
                    <input class="red-color" onclick="hideModalAddCourse()" type="button" value="CANCELAR">
                </div>
            </div>
        </form>
    </div>
</div>


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
