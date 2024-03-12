import os
import sys
from subprocess import run

from supabase import Client, create_client

url: str = os.environ.get("SUPABASE_URL")
key: str = os.environ.get("SUPABASE_KEY")
supabase: Client = create_client(url, key)


POINTS = {"task1": 25, "task2": 25, "task3": 25, "task4": 25}


def get_student_no():
    try:
        no_file = open("student_no.txt", "r", encoding="utf-8").readlines()
        student_no = 0
        for line in no_file:
            no = line.strip()
            if no.startswith("#"):
                continue

            if no.isnumeric() and len(no) == 9:
                student_no = no
                print(f"Found valid student number: {no}")
                break

        return student_no
    except FileNotFoundError:
        print("File student_no.txt not found")
        return 0


def execute_test():
    results = {}
    for task, points in POINTS.items():
        print(f"Executing {task}...")
        p = run(["/root/.local/bin/aptos", "move", "test"], check=True, cwd=f"{task}")
        if p.returncode != 0:
            print(f"Error executing task {task}")
            results[task] = 0
        else:
            print(f"Task {task} executed successfully")
            results[task] = points

    return results


def main():
    student_no = get_student_no()
    if student_no == 0:
        print("Cannot find valid student number")
        sys.exit(1)

    results = execute_test()
    score = sum(results.values())
    print(f"Total score: {score}")
    if score > 0:
        data, count = (
            supabase.table("homework")
            .insert({"student_no": student_no, "score": score})
            .execute()
        )


if __name__ == "__main__":
    main()
