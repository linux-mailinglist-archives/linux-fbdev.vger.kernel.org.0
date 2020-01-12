Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2F321385CB
	for <lists+linux-fbdev@lfdr.de>; Sun, 12 Jan 2020 11:18:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732570AbgALKS0 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 12 Jan 2020 05:18:26 -0500
Received: from mail02.vodafone.es ([217.130.24.81]:46807 "EHLO
        mail02.vodafone.es" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732569AbgALKS0 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 12 Jan 2020 05:18:26 -0500
IronPort-SDR: DoXcQX4coSR5gW0rt5mKtFTU9BaGnM4KCQP8q9woLqepFl5xMvj8f9wDG6kRFzSBNepFT1BOyn
 csC4h+r1iG6A==
IronPort-PHdr: =?us-ascii?q?9a23=3AB1eq7xx2X35nKjbXCy+O+j09IxM/srCxBDY+r6?=
 =?us-ascii?q?Qd2+MVIJqq85mqBkHD//Il1AaPAdyAraga26GP6OjJYi8p2d65qncMcZhBBV?=
 =?us-ascii?q?cuqP49uEgeOvODElDxN/XwbiY3T4xoXV5h+GynYwAOQJ6tL1LdrWev4jEMBx?=
 =?us-ascii?q?7xKRR6JvjvGo7Vks+7y/2+94fcbglVijexe61+IRS1oAneq8Ubj5ZpJ7osxB?=
 =?us-ascii?q?fOvnZGYfldy3lyJVKUkRb858Ow84Bm/i9Npf8v9NNOXLvjcaggQrNWEDopM2?=
 =?us-ascii?q?Yu5M32rhbDVheA5mEdUmoNjBVFBRXO4QzgUZfwtiv6sfd92DWfMMbrQ704RS?=
 =?us-ascii?q?iu4qF2QxPujysJKiI2/3vSis1wla5WvhWhpwZnw47TeoGaLuZ+cb3EcdwEQ2?=
 =?us-ascii?q?pNR9pcVzBdAoymc4QPD/QOPeNGoIn7u1sCtAWxBQ+1CO3ozT9IgGH53K0j3+?=
 =?us-ascii?q?s/FwHNwQgsEtwSvHjIqdn4MroZX+Kow6nS1TjNYfNY2S3j5obLbx4uru2DU7?=
 =?us-ascii?q?1rfMrNy0QgCx/JgkmMpYD7OT6ey+QDs3Kc7+plTe+hkXAoqx1vrTi128wjio?=
 =?us-ascii?q?7JhoQaylvZ8ih52Jg6JcGmR05hb9+kF51Qty6BOot2WcMtWH1ntDwmxb0BvJ?=
 =?us-ascii?q?63ZigKyJc+yhPZdveJcJCI7wr9WOqMIzp0nm9pdbyjixqo70StxffwW8e03V?=
 =?us-ascii?q?tMsyFLiMPDtmoX2BzW8sWHT/x98Vq/1juXzADT7/1EIVgzlarGN54t2r4wmY?=
 =?us-ascii?q?QXsUTEBiL2nV/5jK6SdkU+5Oeo7/jrb7r8qp+CMI97lxvxMqopmsy5H+s0KB?=
 =?us-ascii?q?YBX3OD9eS90r3s41H5Ta1UgvErkKTVqo3WKMoHqqKjHQNY3Zwv5hi/Aju+1d?=
 =?us-ascii?q?QXh3gHLFZLeBKdiIjpPknDIOjmAvejnVusijlqx/fAPr3uGZjNLmPDn6z9cr?=
 =?us-ascii?q?pn90Fczw8zwcpf55JXEr0BOu78WlfttNzECR80Kwi0w+fhCNVg2YISQGyPDb?=
 =?us-ascii?q?SEP6zMr1+F/fwvI+aSa48Pojr9KOYq5+TojXAnnV8RZ66p3YEYaCPwIvMzJ0?=
 =?us-ascii?q?SffGqpjN0NHHkioAUzVqrphUeEXDoVYGy9DJgx/jUqNIXzNYrfS5rlv7uH02?=
 =?us-ascii?q?/vBpBKa3pZDVaDEXTobI+Pc/gJYSOWZMRml2pXe6KmTtoZ2A2jrkfFzLxoZr?=
 =?us-ascii?q?7M9zEVr43k0tdd5/bZnlc58jkyD8fLgDLFdH19gm5dHmx+56t4u0EokQ/b3A?=
 =?us-ascii?q?=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2HaBgDt8RpemCMYgtkUBjMYGwEBAQE?=
 =?us-ascii?q?BAQEFAQEBEQEBAwMBAQGBaAUBAQELAQEBGggBgSWBTVIgEpNQgU0fg0OLY4E?=
 =?us-ascii?q?Agx4VhgcUDIFbDQEBAQEBNQIBAYRATgEXgQ8kNQgOAgMNAQEFAQEBAQEFBAE?=
 =?us-ascii?q?BAhABAQEBAQYNCwYphUqCHQweAQQBAQEBAwMDAQEMAYNdBxkPOUpMAQ4BU4M?=
 =?us-ascii?q?EgksBATOFSJhFAY0EDQ0ChR2CSgQKgQmBGiOBNgGMGBqBQT+BIyGCKwgBggG?=
 =?us-ascii?q?CfwESAWyCSIJZBI1CEiGBB4gpmBeCQQR2iUyMAoI3AQ+IAYQxAxCCRQ+BCYg?=
 =?us-ascii?q?DhE6BfaM3V3QBgR5xMxqCJhqBIE8YDYgbji1AgRYQAk+LOoIyAQE?=
X-IPAS-Result: =?us-ascii?q?A2HaBgDt8RpemCMYgtkUBjMYGwEBAQEBAQEFAQEBEQEBA?=
 =?us-ascii?q?wMBAQGBaAUBAQELAQEBGggBgSWBTVIgEpNQgU0fg0OLY4EAgx4VhgcUDIFbD?=
 =?us-ascii?q?QEBAQEBNQIBAYRATgEXgQ8kNQgOAgMNAQEFAQEBAQEFBAEBAhABAQEBAQYNC?=
 =?us-ascii?q?wYphUqCHQweAQQBAQEBAwMDAQEMAYNdBxkPOUpMAQ4BU4MEgksBATOFSJhFA?=
 =?us-ascii?q?Y0EDQ0ChR2CSgQKgQmBGiOBNgGMGBqBQT+BIyGCKwgBggGCfwESAWyCSIJZB?=
 =?us-ascii?q?I1CEiGBB4gpmBeCQQR2iUyMAoI3AQ+IAYQxAxCCRQ+BCYgDhE6BfaM3V3QBg?=
 =?us-ascii?q?R5xMxqCJhqBIE8YDYgbji1AgRYQAk+LOoIyAQE?=
X-IronPort-AV: E=Sophos;i="5.69,424,1571695200"; 
   d="scan'208";a="323319455"
Received: from mailrel04.vodafone.es ([217.130.24.35])
  by mail02.vodafone.es with ESMTP; 12 Jan 2020 11:18:16 +0100
Received: (qmail 24214 invoked from network); 12 Jan 2020 05:00:20 -0000
Received: from unknown (HELO 192.168.1.3) (quesosbelda@[217.217.179.17])
          (envelope-sender <peterwong@hsbc.com.hk>)
          by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
          for <linux-fbdev@vger.kernel.org>; 12 Jan 2020 05:00:20 -0000
Date:   Sun, 12 Jan 2020 06:00:19 +0100 (CET)
From:   Peter Wong <peterwong@hsbc.com.hk>
Reply-To: Peter Wong <peterwonghkhsbc@gmail.com>
To:     linux-fbdev@vger.kernel.org
Message-ID: <20593474.460719.1578805219903.JavaMail.cash@217.130.24.55>
Subject: Investment opportunity
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Greetings,
Please read the attached investment proposal and reply for more details.
Are you interested in loan?
Sincerely: Peter Wong




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.

