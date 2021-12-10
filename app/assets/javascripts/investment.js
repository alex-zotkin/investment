new Vue({
    el: '.content',
    data: {
        data: {}
    },
    mounted: function(){
        let self = this;
        $.ajax({
            method: "GET",
            url: "https://www.cbr-xml-daily.ru/daily_json.js",
            success: function( msg ) {
                self.data = JSON.parse(msg);
                console.log(self.data);
            },
        });

    }
});