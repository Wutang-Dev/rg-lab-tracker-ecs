const categories = ["aws", "docker", "terraform"];

        function updateDashboard(data) {
            let total = 0;

            categories.forEach(category => {
                const count = Number(data[category] || 0);
                document.getElementById(category).textContent = count;
                total += count;
            });

            document.getElementById("total").textContent = total;
        }

        async function loadLabs() {
            try {
                const response = await fetch("/api/labs");
                if (!response.ok) throw new Error("Unable to load lab counts");

                updateDashboard(await response.json());
                document.getElementById("error").textContent = "";
            } catch (error) {
                document.getElementById("error").textContent =
                    "Unable to connect to the application. Please try again.";
            }
        }

        async function incrementLab(category) {
            if (!categories.includes(category)) return;

            const buttons = document.querySelectorAll("button");
            buttons.forEach(button => button.disabled = true);

            try {
                const response = await fetch(
                    `/api/labs/${category}/increment`,
                    { method: "POST" }
                );

                if (!response.ok) throw new Error("Unable to update counter");

                await loadLabs();
            } catch (error) {
                document.getElementById("error").textContent =
                    "Unable to update lab count. Please try again.";
            } finally {
                buttons.forEach(button => button.disabled = false);
            }
        }

        loadLabs();