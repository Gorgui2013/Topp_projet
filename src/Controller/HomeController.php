<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Projet;
use App\Repository\ProjetRepository;
use App\Form\ProjetType;
use App\Entity\Step;
use App\Repository\StepRepository;
use App\Form\StepType;
use App\Entity\Task;
use App\Repository\TaskRepository;
use App\Form\TaskType;

class HomeController extends AbstractController
{
    /**
     * @Route("/home", name="home")
     */
    public function index(ProjetRepository $q, Request $request): Response
    {
        $projet = new Projet();
        $projetForm = $this->createForm(ProjetType::class, $projet);
        $projetForm->handleRequest($request);

        if($request->isMethod('POST')) {

            $manager = $this->getDoctrine()->getManager();
            if ($projetForm->isSubmitted() && $projetForm->isValid()) {

                /** @var \App\Entity\User $user */
                $user = $this->getUser();
                $projet->setUser($user);

                // dd($projet);
                // data persister
                $manager->persist($projet);
                $manager->flush();

                // return to referer
                $this->addFlash('success', 'Modification faite avec succé !');
                return $this->redirect($request->headers->get('referer'));
            }

        }
        $projets = $q->findAll();
        return $this->render('home/index.html.twig', [
            'projets' => $projets,
            'projetForm' => $projetForm->createView(),
        ]);
    }

    /**
     * @Route("/home/projet/{id}", name="single_projet")
     */
    public function projet($id, ProjetRepository $qp, Request $request): Response
    {
        $projet = $qp->find($id);

        $step = new Step();
        $stepForm = $this->createForm(StepType::class, $step);
        $stepForm->handleRequest($request);

        $task = new Task();
        $taskForm = $this->createForm(TaskType::class, $task);
        $taskForm->handleRequest($request);

        if($request->isMethod('POST')) {

            $manager = $this->getDoctrine()->getManager();
            if ($stepForm->isSubmitted() && $stepForm->isValid()) {

                $step->setProjet($projet);

                // dd($projet);
                // data persister
                $manager->persist($step);
                $manager->flush();

                // return to referer
                $this->addFlash('success', 'Modification faite avec succé !');
                return $this->redirect($request->headers->get('referer'));
            }

        }
        return $this->render('home/single_projet.html.twig', [
            'projet' => $projet,
            'stepForm' => $stepForm->createView(),
            'taskForm' => $taskForm->createView(),
        ]);
    }

    /**
     * @Route("/home/task", name="task")
     */
    public function task(StepRepository $qs, Request $request): Response
    {
        $task = new Task();
        $taskForm = $this->createForm(TaskType::class, $task);
        $taskForm->handleRequest($request);
        $manager = $this->getDoctrine()->getManager();
        if ($taskForm->isSubmitted() && $taskForm->isValid()) {

            $manager->persist($task);
            $manager->flush();

                // return to referer
            $this->addFlash('success', 'Modification faite avec succé !');
            return $this->redirect($request->headers->get('referer'));
        }
        return $this->redirect($request->headers->get('referer'));
    }
}
