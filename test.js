let counter = 0

const increment = () => {
  counter ++;
};


export const f1 = (num) => {
  if (num > 1) {
    increment()
    return
  }

  console.log("f1 call")
};

export const f2 = async (num) => {
  if (num > 1) {
    increment()
    return
  }

  await fetch("qwerty123")
};