<script lang="ts">
  import "../app.css";
  import { createThemeSwitcher, Theme } from 'svelte-theme-select';
  import { github, linkedin } from 'svelte-awesome/icons';
  import { Icon } from 'svelte-awesome';
  import InstructionsModal from '$lib/InstructionsModal.svelte';

  let store = createThemeSwitcher()
  let val = 'system'
  store.subscribe(value => {
    val = value
  });

  function setTheme(val: string) {
    if (val === 'system') {
      store.setTheme('system')
    } else if (val === 'light') {
      store.setTheme('light')
    } else if (val === 'dark') {
      store.setTheme('dark')
    }
  }

  let hideModal = true;
</script>

<div class="flex flex-col justify-between min-h-screen">
  <nav class="flex md:flex-row max-md:flex-col justify-between bg-gray-300 dark:bg-gray-800">

    <div class="flex flex-row gap-5 items-center">
      <p class="p-2 sm:text-4xl max-sm:text-2xl">Indian Constitution</p>
      <div class="content max-sm:hidden">
        <a href="https://github.com/BoogieMonster1O1/icystudy" target="_blank" class="pr-5">
          <Icon data={github} scale={2} />
        </a>
        <a href="https://www.linkedin.com/in/shrish-deshpande-6287561a9" target="_blank">
          <Icon data={linkedin} scale={2} />
        </a>
      </div>
      <div class="content sm:hidden gap-5">
        <a href="https://github.com/BoogieMonster1O1/icystudy" target="_blank" class="pr-5">
          <Icon data={github} scale={1.5} />
        </a>
        <a href="https://www.linkedin.com/in/shrish-deshpande-6287561a9" target="_blank">
          <Icon data={linkedin} scale={1.5} />
        </a>
      </div>
    </div>
    <div class="flex flex-row flex-none items-center">
      <button on:click={() => { hideModal = false }} class=" max-md:hidden px-4">
        Keybindings
      </button>
      <p class="p-2">Theme: </p>
      <select bind:value={val} on:change={() => {setTheme(val)}} class="dark:bg-neutral-700 appearance-none w-24 flex-none text-lg px-1 ml-0 text-center mr-4">
        <option value="system">System</option>
        <option value="light">Light</option>
        <option value="dark">Dark</option>
      </select>
    </div>
  </nav>

  <slot />

  <footer class="text-center w-screen">
    <p class="text-xs">© GNU AGPL</p>
  </footer>
</div>

<Theme />

<span class:hidden={hideModal} ><InstructionsModal callback={() => hideModal = true}/></span>
