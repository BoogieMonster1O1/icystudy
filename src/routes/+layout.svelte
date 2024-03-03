<script lang="ts">
  import "../app.css";
  import { createThemeSwitcher, Theme } from 'svelte-theme-select';
  import { github, linkedin } from 'svelte-awesome/icons';
  import { Icon } from 'svelte-awesome';

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
</script>

<nav class="flex flex-row justify-between bg-gray-300 dark:bg-gray-800">

  <div class="flex flex-row gap-5 items-center">
    <p class="p-2 text-4xl">Indian Constitution</p>
    <a href="https://github.com/BoogieMonster1O1/icystudy" target="_blank">
      <Icon data={github} scale={2} />
    </a>
    <a href="https://www.linkedin.com/in/shrish-deshpande-6287561a9" target="_blank">
      <Icon data={linkedin} scale={2} />
    </a>
  </div>
  <div class="flex flex-row flex-none items-center">
    <p class="p-2">Theme: </p>
    <select bind:value={val} on:change={() => {setTheme(val)}} class="dark:bg-neutral-700 appearance-none w-24 flex-none text-lg m-4 px-1 ml-0 text-center">
      <option value="system">System</option>
      <option value="light">Light</option>
      <option value="dark">Dark</option>
    </select>
  </div>
</nav>

<slot />

<footer class="flex flex-row justify-center">
  <p class="text-sm">© GNU AGPL</p>
</footer>

<Theme />
