<template>
	<div class="">
		<!-- <login @click="GET()" style="position: fixed; z-index: 5; width: 100%; height: 100%; top: 0px;" v-if="!gets"/> -->
		<home />
		<!-- <RepairP01 /> -->
		<!-- <Tutorial/> -->
		<!-- <h2 style="color:white ;">API NEWS</h2>
		<div class="container-pages2 div-center">
			<div class="item" v-for="(item, index) in news " :key="index">
				<div class="index"> {{ 1 + index }}</div>
				<div class="img">
					<img v-if="item.urlToImage" :src="item.urlToImage" alt style="width: 255px ; height: 155px;">
					<img v-if="!item.urlToImage"
						src="https://cdn.discordapp.com/attachments/748930293028749338/1038773439625973791/404.png" alt
						style="width: 255px ; height: 155px;">
				</div>
				<p class="text-s"> <b class="B_title">title :</b> {{ item.title }}</p>
				<p class="text-s"> <b class="B_title">content :</b> {{ item.content }}</p>
				<p class="text-s author"> author : {{ item.author }} <b class="text-s" v-if="!item.author"
						style="color: rebeccapurple ;"> no author </b> </p>
	
				<button class="button-2 " style="color: aliceblue; background-color: rebeccapurple;" :href="item.url"
					@click="() => $router.pout(item.url)"> go to webpage</button>
			</div>
		</div> -->

	</div>
</template>

<script>
import axios from 'axios';
export default {
	name: 'index',
	data() {
		return {
			data: "Hi",
			// news: [1],
			gets: ''
		}
	},
	mounted() {
		const get = localStorage.getItem('mode')
		this.$router.push({ name: 'index', path: '/', query: { Index: 1 } })
		// const url = ``
		// axios.get(url).then(response => {
		// 	this.news = response.data.articles
		// })\
		// setInterval(() => {
		// 	this.gets = localStorage.getItem('acessToken')
		// }, 1000);

	},
	methods: {

		GET() {
			console.log(1);

		}
	}

}
</script>

<style>
.container-pages2 {
	display: flex;
	flex-flow: row wrap;
	/* grid-auto-columns: 1fr 1fr; */
	justify-content: center;
	/* justify-items: center; */
	max-width: 63%;
	margin-top: 10px;
	/* background-color: #e98195; */
	column-gap: 20px;
	row-gap: 20px;

	padding: 1%;
	margin: auto;
}
</style>