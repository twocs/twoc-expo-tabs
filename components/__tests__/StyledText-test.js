import { render } from "@testing-library/react-native";
import { MonoText } from "../StyledText";

describe("MonoText component", () => {
  it("renders correctly", () => {
    const { getByText } = render(<MonoText>Snapshot test!</MonoText>);

    // Check that the text is rendered
    expect(getByText("Snapshot test!")).toBeTruthy();

    // Check that it has the correct style (monospace font)
    const textElement = getByText("Snapshot test!");
    expect(textElement).toHaveStyle({ fontFamily: "SpaceMono" });
  });

  it("applies custom styles", () => {
    const customStyle = { fontSize: 20, color: "red" };
    const { getByText } = render(<MonoText style={customStyle}>Custom styled text</MonoText>);

    const textElement = getByText("Custom styled text");
    expect(textElement).toHaveStyle(customStyle);
    expect(textElement).toHaveStyle({ fontFamily: "SpaceMono" });
  });
});
