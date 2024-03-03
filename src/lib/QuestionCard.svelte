<script lang="ts">
  import { type Question } from '$lib';

  export let question: Question;
  export let callback: (value: boolean) => void;

  $: selectedOption = question.count - question.count - 1
  let letterMap = ['A', 'B', 'C', 'D'];

  function selectOption(optionIndex: number) {
    if (selectedOption !== -1) {
      return;
    }
    selectedOption = optionIndex;
    callback(optionIndex === question.correct);
  }
</script>

<div class="flex flex-col">
  {#each question.question.split('\n') as line}
    <p class="text-lg pb-2">{line}</p>
  {/each}

  {#each question.options as option, index}
    <button
      class="mt-2 px-4 py-2 rounded border border-gray-400 transition duration-100"
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
