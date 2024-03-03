<script lang="ts">
  export let callback: () => void;
</script>

<div class="relative z-10" aria-labelledby="modal-title" role="dialog" aria-modal="true">
  <div class="fixed inset-0 bg-gray-500 bg-opacity-25 transition"></div>

  <div class="fixed inset-0 z-10 w-screen overflow-y-auto">
    <div class="flex min-h-full items-end justify-center p-4 text-center sm:items-center sm:p-0">
      <div class="relative transform overflow-hidden rounded-lg bg-white dark:bg-black text-left shadow-xl transition-all sm:my-8 sm:w-full sm:max-w-lg">
        <div class="bg-white dark:bg-black px-4 pb-4 pt-5 sm:p-6 sm:pb-4">
          <div class="sm:flex sm:items-start">
            <div class="mt-3 text-center sm:ml-4 sm:mt-0 sm:text-left">
              <h3 class="text-base font-semibold leading-6 text-gray-900 dark:text-neutral-50 text-2xl" id="modal-title">Keyboard Shortcuts</h3>
              <div class="mt-2">
                <div class="grid grid-cols-2">
                  <kbd>a</kbd>
                  <p class="text-sm">Select first option</p>

                  <kbd>b</kbd>
                  <p class="text-sm">Select second option</p>

                  <kbd>c</kbd>
                  <p class="text-sm">Select third option</p>

                  <kbd>d</kbd>
                  <p class="text-sm">Select fourth option</p>

                  <kbd>Enter</kbd>
                  <p class="text-sm">Move to next question</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="px-4 py-3 sm:flex sm:flex-row-reverse sm:px-6">
          <button type="button" class="inline-flex w-full justify-center rounded-md bg-green-500 px-8 py-2 text-sm font-semibold text-white shadow-sm hover:bg-green-600 transition sm:ml-3 sm:w-auto" on:click={callback}>Done</button>
        </div>
      </div>
    </div>
  </div>
</div>
