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
        /** @var \App\Entity\User $user */
        $user = $this->getUser();

        if($request->isMethod('POST')) {

            $manager = $this->getDoctrine()->getManager();
            if ($projetForm->isSubmitted() && $projetForm->isValid()) {

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
        $projets = $q->findBy(['user' => $user->getId()]);
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

            $task->setStep($qs->find($request->request->get('step')));
            $manager->persist($task);
            $manager->flush();

                // return to referer
            $this->addFlash('success', 'Modification faite avec succé !');
            return $this->redirect($request->headers->get('referer'));
        }
        return $this->redirect($request->headers->get('referer'));
    }

    /**
     * @Route("/home/projet/{id}/edit", name="edit_projet")
     */
    public function editprojet($id, ProjetRepository $q, Request $request): Response
    {
        $projet = $q->find($id);

        // dd(new \Datetime($request->request->get('begin')));
        $manager = $this->getDoctrine()->getManager();

        $projet->setName($request->request->get('name'));
        $projet->setDescription($request->request->get('description'));
        $projet->setBegin(new \Datetime($request->request->get('begin')));
        $projet->setEnd(new \Datetime($request->request->get('end')));
        $projet->setUpdatedAt(new \DateTime());

        $manager->persist($projet);
        $manager->flush();

        $this->addFlash('success', 'Modification faite avec succé !');
        return $this->redirect($request->headers->get('referer'));

    }

    /**
     * @Route("/home/step/{id}/edit", name="edit_step")
     */
    public function editstep($id, StepRepository $q, Request $request): Response
    {
        $step = $q->find($id);

        // dd(new \Datetime($request->request->get('begin')));
        $manager = $this->getDoctrine()->getManager();

        $step->setName($request->request->get('name'));
        $step->setDescription($request->request->get('description'));
        $step->setUpdatedAt(new \DateTime());

        $manager->persist($step);
        $manager->flush();

        $this->addFlash('success', 'Modification faite avec succé !');
        return $this->redirect($request->headers->get('referer'));

    }

    // /**
    //  * @Route("/home/task/{id}/edit", name="edit_task")
    //  */
    // public function edittask($id, TaskRepository $q, Request $request): Response
    // {
    //     $task = $q->find($id);

    //     // dd(new \Datetime($request->request->get('begin')));
    //     $manager = $this->getDoctrine()->getManager();

    //     $task->setName($request->request->get('name'));
    //     $task->setDescription($request->request->get('description'));
    //     $task->setUpdatedAt(new \DateTime());

    //     $manager->persist($task);
    //     $manager->flush();

    //     $this->addFlash('success', 'Modification faite avec succé !');
    //     return $this->redirect($request->headers->get('referer'));

    // }

    /**
     * @Route("/home/{id}/delete projet", name="delete_projet")
     */
    public function deleteProjet($id, ProjetRepository $q, Request $request): Response
    {
        $projet = $q->find($id);
        $manager = $this->getDoctrine()->getManager();
        $manager->remove($projet);
        $manager->flush();

        $this->addFlash('success', 'Suppression faite avec succé !');
        return $this->redirect($request->headers->get('referer'));
    }

    /**
     * @Route("/home/{id}/delete step", name="delete_step")
     */
    public function deleteStep($id, StepRepository $q, Request $request): Response
    {
        $step = $q->find($id);
        $manager = $this->getDoctrine()->getManager();
        $manager->remove($step);
        $manager->flush();

        $this->addFlash('success', 'Suppression faite avec succé !');
        return $this->redirect($request->headers->get('referer'));
    }

    /**
     * @Route("/home/{id}/delete task", name="delete_task")
     */
    public function deleteTask($id, TaskRepository $q, Request $request): Response
    {
        $task = $q->find($id);
        $manager = $this->getDoctrine()->getManager();
        $manager->remove($task);
        $manager->flush();

        $this->addFlash('success', 'Suppression faite avec succé !');
        return $this->redirect($request->headers->get('referer'));
    }
}
