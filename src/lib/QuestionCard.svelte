<script lang="ts">
  import { type Question } from '$lib';
  import { browser } from '$app/environment';

  export let question: Question;
  export let callback: (value: boolean) => void;

  $: selectedOption = question.count - question.count - 1
  let letterMap = ['A', 'B', 'C', 'D'];
  let smallLetterMap = ['a', 'b', 'c', 'd'];

  function selectOption(optionIndex: number) {
    if (selectedOption !== -1) {
      return;
    }
    selectedOption = optionIndex;
    callback(optionIndex === question.correct);
  }

  if (browser) {
    for (let i = 0; i < question.options.length; i++) {
      let letter = smallLetterMap[i];
      window.addEventListener('keydown', (e) => {
        if (e.key === letter && selectedOption === -1) {
          selectOption(i);
        }
      });
    }
  }
</script>

<div class="flex flex-col">
  {#each question.question.split('\n') as line}
    <p class="text-lg pb-2">{line}</p>
  {/each}

  {#each question.options as option, index}
    <button
      class="mt-2 px-4 py-2 rounded border border-gray-400 transition"
      class:selected={selectedOption === index}
      class:correct={selectedOption !== -1 && question.correct === index}
      class:incorrect={selectedOption !== -1 && selectedOption !== question.correct && selectedOption === index}
      disabled={selectedOption !== -1}
      on:click={() => selectOption(index)}
    >
      {letterMap[index]}. {option}
    </button>
  {/each}
</div>

<style>
  .correct {
    background-color: #4CAF50;
    color: white;
  }

  .incorrect {
    background-color: #f44336;
    color: white;
  }

  button[disabled] {
    cursor: not-allowed;
  }

  button:focus {
    outline: none;
  }
</style>
