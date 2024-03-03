<script lang="ts">
  import { type Question } from '$lib';
  import QuestionCard from '$lib/QuestionCard.svelte';
  import { browser } from '$app/environment';

  export let data: { data: [Question]};

  let questions = data.data;

  let currentQuestion = 0;
  let totalQuestions = questions.length;
  let score = 0;
  let answeredQuestions = 0;
  $: percent = (currentQuestion == 0 ? 0 : (score / answeredQuestions) * 100).toFixed(2);
  let called = false;

  function callback(value: boolean) {
    if (value) {
      score++;
    }
    called = true;
    answeredQuestions++;
  }

  function nextQuestion() {
    currentQuestion++;
    called = false;
  }

  if (browser) {
    window.addEventListener('keydown', (e) => {
      if (e.key === 'Enter' && called) {
        nextQuestion();
      }
    });
  }
</script>

<svelte:head>
  <title>Indian Constitution</title>
</svelte:head>

<div class="flex flex-col justify-center items-center p-4 transition max-h-screen">
  <h1 class="text-3xl font-bold">Question {currentQuestion + 1}</h1>

  <div class="flex flex-col justify-center items-center dark:bg-neutral-900 bg-neutral-200 shadow rounded px-10 py-5 md:w-[75%] transition">
    {#if currentQuestion < totalQuestions}
      <QuestionCard question={questions[currentQuestion]} {callback} />
    {:else}
      <h2 class="text-xl font-bold">All done!</h2>
    {/if}

    <button
      class="mt-2 px-4 py-2 rounded border border-gray-400 transition duration-100"
      on:click={nextQuestion}
    >
      {#if called}
        Next
      {:else}
        Skip
      {/if}
    </button>

    <h2 class="text-xl font-bold">Score: {score} / {answeredQuestions}</h2>
    <h2 class="text-xl font-bold">Percentage: {percent}%</h2>
  </div>
</div>
