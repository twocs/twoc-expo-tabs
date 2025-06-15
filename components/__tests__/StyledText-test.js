import renderer from "react-test-renderer";
import { MonoText } from "../StyledText";

it(`renders correctly`, () => {
  const component = renderer.create(<MonoText>Snapshot test!</MonoText>);
  const tree = component.toJSON();

  expect(tree).toMatchSnapshot();
});
