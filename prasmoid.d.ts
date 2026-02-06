/**
 * This file provides type definitions for the custom command environment in Prasmoid.
 * It is used by code editors like VS Code to provide autocompletion and type-checking.
 *
 * @see https://www.typescriptlang.org/docs/handbook/jsdoc-supported-types.html
 */

/**
 * The context object passed to every custom command's Run function.
 */
interface CommandContext {
  /**
   * Returns the command-line arguments passed after the command name.
   * @returns {string[]} An array of arguments.
   * @example
   * const args = ctx.Args();
   * console.log(args[0]);
   */
  Args(): string[];

  /**
   * Provides access to the flags passed to the command.
   */
  Flags(): {
    /**
     * Retrieves the value of a specific flag.
     * @param name The name of the flag to retrieve.
     * @returns {string | boolean | undefined} The value of the flag, or undefined if not found.
     * @example
     * const name = ctx.Flags().get("name");
     */
    get(name: string): string | boolean | undefined;

    /**
     * You can also access flags directly as properties, but using get() is recommended for better type safety.
     * @example
     * const myFlag = ctx.Flags().myFlagName; // Type is 'any'
     */
    [key: string]: any;
  };
}

/**
 * The global prasmoid module for interacting with the project.
 */
declare module "prasmoid" {
  /**
   * Retrieves a value from the project's metadata.json file.
   * @param key The key from the "KPlugin" section of metadata.json (e.g., "Id", "Version").
   * @returns {string | undefined} The value from the metadata, or undefined if not found.
   */
  export function getMetadata(key: string): string | undefined;
  /**
   * Registers a custom command.
   * @param config The configuration for the command.
   */
  export function Command(config: Config): void;
}

/**
 * Configuration for the custom command.
 */
interface Config {
  run: (ctx: CommandContext) => void;
  /** A brief description of your command. */
  short: string;
  /** A longer description that spans multiple lines. */
  long: string;
  /** Optional aliases for the command. */
  alias?: string[];
  /** Flag definitions for the command. */
  flags?: {
    name: string;
    shorthand?: string;
    type: "string" | "boolean";
    default?: string | boolean;
    description: string;
  }[];
}

interface Console {
  /**
   * Logs a red-colored message.
   */
  red(...message: any[]): void;

  /**
   * Logs a green-colored message.
   */
  green(...message: any[]): void;

  /**
   * Logs a yellow-colored message.
   */
  yellow(...message: any[]): void;

  /**
   * Flexible color logger. Last argument must be a color string.
   * @example
   * console.color("Hey", "you!", "red")
   */
  color(
    ...args: [
      ...any[],
      "red" | "green" | "yellow" | "blue" | "magenta" | "cyan" | "black",
    ]
  ): void;
}

declare var console: Console;
