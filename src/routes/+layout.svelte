<script lang="ts">
  import "../app.css";
  import { createThemeSwitcher, Theme } from 'svelte-theme-select';

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
<!--  <p>Indian Constitution</p>-->

<!--  <ThemeSelect />-->

<!--  <div class="hidden md:block">-->
<!--    <ThemeToggle />-->
<!--  </div>-->

<!--  <div class="block md:hidden">-->
<!--    <ThemeSelect />-->
<!--  </div>-->

  <p class="p-2 text-4xl">Indian Constitution</p>
  <div class="flex flex-row flex-none items-center">
    <p class="p-2">Theme: </p>
    <select bind:value={val} on:change={() => {setTheme(val)}} class="dark:bg-neutral-700 appearance-none w-24 flex-none text-lg m-4 px-1 ml-0">
      <option value="system">System</option>
      <option value="light">Light</option>
      <option value="dark">Dark</option>
    </select>
  </div>
</nav>

<slot />

<Theme />
