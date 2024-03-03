import json from './out.json'

export default json;

export interface Question {
  correct: number;
  count: number;
  options: string[];
  question: string;
}
