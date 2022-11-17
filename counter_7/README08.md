Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.

-- Navigator.push : digunakan untuk menambahkan rute lain ke atas tumpukan screen(stack) saat ini. Halaman baru ditampilkan di atas halaman sebelumnya.

    Navigator.pushReplacement : akan membuat layer baru dan akan menghapus layer yang sudah ada sebelumnya.

Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

-- drawer: navbar
    card: show data in card form, 
    column/padding/row: buat fields, 
    container: buat ngegroup data, 
    textFormField: ask text input, 
    form: container buat ngegroup field2 yang di input, 
    DropDownButton: buat bikin down arrow

Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).

-- onPressed
    onTap
    onChange
    onComplete
    dll

Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.

-- saat memakai navigator.Push layar akan ditimpa dengan layar baru dengan kondisi layar yang lama masih tersimpan di bawah layer yang added, sedangkan Navigator.pushReplacement akan membuat layar baru dan menghapus layar yang sudah ada

Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

-- membuat file data.dart(berisi data-data dari budget), form.dart(isinya adalah form budget), budget.dart, dan juga main.dart