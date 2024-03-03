import json from '$lib';

export const load = async () => {
  return {
    data: json.sort(() => Math.random() - 0.5)
  }
};
