<script lang="ts">
  import json from '$lib';
  import QuestionCard from '$lib/QuestionCard.svelte';

  let questions = json.sort(() => Math.random() - 0.5);

  let currentQuestion = 0;
  let totalQuestions = questions.length;
  let score = 0;
  $: percent = (currentQuestion == 0 ? 0 : (score / currentQuestion) * 100).toFixed(2);

  function callback(value: boolean) {
    if (value) {
      score++;
    }
  }

  function nextQuestion() {
    currentQuestion++;
  }
</script>

<svelte:head>
  <title>Indian Constitution</title>
</svelte:head>

<div class="flex flex-col justify-center items-center shadow bg-neutral-200 rounded p-4 transition">
  <h1 class="text-3xl font-bold">Indian Constitution</h1>
  <h2 class="text-xl font-bold">Question {currentQuestion + 1} of {totalQuestions}</h2>
  {#if currentQuestion < totalQuestions}
    <QuestionCard question={questions[currentQuestion]} {callback} />
  {:else}
    <h2 class="text-xl font-bold">All done!</h2>
  {/if}

  <button
    class="mt-2 px-4 py-10 rounded border border-gray-400 transition duration-100"
    class:disabled={true}
    on:click={nextQuestion}
  >
    Next
  </button>

  <h2 class="text-xl font-bold">Score: {score} / {currentQuestion}</h2>
  <h2 class="text-xl font-bold">Percentage: {percent}%</h2>
</div>
