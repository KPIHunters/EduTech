function resizeFullScreenIframe() {
    Swal.fire({
        title: 'Carregando Vídeo',
        html: '',
        didOpen: () => {
            Swal.showLoading();
        }
    });
    
    function setSize() {
        let iFrame = document.querySelector('iframe');
        iFrame.style.height = '80vh';

        $('iframe').on('load', function() {
            Swal.close(); 
        });
    }

    $(document).ready(setSize);
    $(document).on('page:load', setSize);
    document.addEventListener('turbolinks:request-start', setSize);
    document.addEventListener('turbolinks:load', setSize);
    window.addEventListener('load', function () {
        setSize()
    });
}