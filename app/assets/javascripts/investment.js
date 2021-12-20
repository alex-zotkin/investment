new Vue({
    el: '.content',
    data: {
        data: {},
        addOpen: false,
        addData: {},


        investData: {},
    },
    mounted: async function(){
        let response = await fetch('https://www.cbr-xml-daily.ru/daily_json.js');
        if(response.ok){
            this.data = await response.json();
        }

        this.load();


    },
    methods:{
        async load(){
            let response = await fetch('/investment/allinfoaboutuser', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json;charset=utf-8',
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            let result = await response.json();
            this.investData = result;
            console.log(result);
        },

        async add(){
            for (let el in this.data.Valute) {
                if(this.data.Valute[el].CharCode === this.addData.code){
                    this.addData.name = this.data.Valute[el].Name;
                    this.addData.coast = this.data.Valute[el].Value;
                    break;
                }
            }

            await fetch('/investment/add', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json;charset=utf-8',
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                body: this.addData
            }).then(()=>{
                this.addOpen = false;
                this.load();
            });
        },


        async setInvestCount(id, e){
            let count = e.target.value;

            let responce = await fetch('/investment/setinvestcount', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json;charset=utf-8',
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                body: JSON.stringify({id: id, count: count})
            });

            if(responce.ok){
                await this.load();
            }
        },

        async deleteInvest(id){
            let responce = await fetch('/investment/deleteinvest/' + id, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json;charset=utf-8',
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
            });

            if(responce.ok){
                await this.load();
            }
        }
    }
});