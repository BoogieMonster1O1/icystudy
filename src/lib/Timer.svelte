<script>
  import { onMount, onDestroy } from 'svelte';
  import { browser } from '$app/environment';

  let timer;
  let hours = 0;
  let minutes = 0;
  let seconds = 0;

  function startTimer() {
    timer = setInterval(() => {
      seconds++;
      if (seconds === 60) {
        seconds = 0;
        minutes++;
      }
      if (minutes === 60) {
        minutes = 0;
        hours++;
      }
    }, 1000);
  }

  function stopTimer() {
    clearInterval(timer);
  }

  if (browser) {
    onMount(startTimer);
    onDestroy(stopTimer);
  }
</script>

<div>
  <p>
    Time Elapsed:
    {#if hours > 0}
      {hours} hour{#if hours > 1}s{/if},
    {/if}
    {#if minutes > 0}
      {minutes} minute{#if minutes > 1}s{/if},
    {/if}
    {seconds} second{#if seconds !== 1}s{/if}
  </p>
</div>
